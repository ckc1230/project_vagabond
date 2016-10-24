class SessionsController < ApplicationController

	def create
		if User.confirm(params[:email], params[:password])
	      user = User.find_by({email: params[:email]})
	      session[:user_id] = user.id
	      redirect_to user_path(user)
	    else
	      flash[:error] = "Error logging in"
	      redirect_to login_path
	    end
	end
end
