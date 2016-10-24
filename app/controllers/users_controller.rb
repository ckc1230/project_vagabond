class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		redirect_to user_path(@user)
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :current_city, :email, :profile_images, :password_digest)
	end
end
