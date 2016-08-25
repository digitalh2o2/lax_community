class UsersController < ApplicationController
	before_action :set_current_user, only: [:show] 
	before_action :authenticate_user!
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	def index
		@users = User.all
		authorize User
	end

	def show
		authorize @user
	end

	private

	def set_current_user
		@user = User.find(params[:id])		
	end
end
