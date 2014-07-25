class SessionsController < ApplicationController

	#route for the log in form
	def new
	end

	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			return redirect_to user_path @user
		else
			flash[:notice] = "Login Failed"
			return redirect_to home_path
		end
	end

	#route for logging out a user
	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged Out"
		return redirect_to home_path
	end

end
