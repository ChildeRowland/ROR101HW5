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
		@user = User.new(params[:user])
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
		if @user.update_attributes(params[:user]) 
			flash[:notice] = "User info updated"
			redirect_to user_path @user
		end
	end

end
