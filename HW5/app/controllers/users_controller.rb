class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new(params[:user])
	end

	def create
		
		puts params.inspect

		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "New User Added"
			redirect_to user_path @user
		else
			flash[:notice] = "user not added"
			redirect_to new_user_path
		end

	end

end
