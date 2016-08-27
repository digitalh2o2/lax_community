class CallbacksController < Devise::OmniauthCallbacksController
	def facebook
		if user = User.find_by(email: request.env["omniauth.auth"].info.email)
			user.update(uid: request.env["omniauth.auth"].uid)
			user.update(provider: request.env["omniauth.auth"].provider)
			user.save
			sign_in_and_redirect user
		else
			@user = User.from_omniauth(request.env["omniauth.auth"])
			sign_in_and_redirect @user
		end
	end
end