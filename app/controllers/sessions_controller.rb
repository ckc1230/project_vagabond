class SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:verify_login]

	def create
		if User.confirm(params[:email], params[:password])
	      user = User.find_by({email: params[:email]})
	      session[:user_id] = user.id
	      redirect_to user_path(user)
	    else
	      redirect_to login_path
	    end
	end

	def destroy
		session.delete(:user_id)
		current_user = nil
		redirect_to root_path
	end

	def verify_login
		if User.confirm(params[:email], params[:password])
			render :status => 200, nothing: true
		else
			render :status => 400, nothing: true
		end
	end
end
