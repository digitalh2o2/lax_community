class UsersController < ApplicationController
	before_action :set_current_user, only: [:show] 
	before_action :authenticate_user!

	def show

	end

	private

	def set_current_user
		@user = User.find(params[:id])
		authorize @user
	end
end
