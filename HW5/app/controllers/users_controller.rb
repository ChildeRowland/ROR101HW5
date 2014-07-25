class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		id = params[:id]
		@user = User.find(id)
	end

	def new
		@user = User.new(params[:user])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "New User Added"
			redirect_to user_path @user
		else
			flash[:notice] = "user not added"
			redirect_to new_user_path
		end
	end

	def edit
		id = params[:id]
		@user = User.find(id)
	end

	def update
		id = params[:id]
		@user = User.find(id)
		if @user.update_attributes(user_params) 
			flash[:notice] = "User info updated"
			redirect_to user_path @user
		end
	end

	def destroy
		u = User.find(params[:id])
		if u.delete
			flash[:notice] = "The user has been deleted."
			redirect_to home_path
		else
			flash[:notice] = "There was a problem with the request."
			redirect_to user_path @user
		end
	end

	private   
	def user_params     
		params.require(:user).permit(:fname, :lname, :email, :password)   
	end

end
