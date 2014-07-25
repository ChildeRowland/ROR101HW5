class PostsController < ApplicationController

	def all_posts
		@post = Post.all
	end

	def user_posts
		# id = params[:id]
		# @user = User.find(id)
		@user = User.find(params[:id])
		@post = @user.posts.new(params[:post])
	end

	def new
	end

	def create
		# id = params[:id]
		# @user = User.find(id)
		# puts params
		@user = User.find(params[:id])
		@post = @user.posts.new(params[:post])
		if @post.save
			flash[:notice] = "New Post Added"
			redirect_to user_path @user
		else
			flash[:notice] = "Post not added"
			redirect_to new_user_path
		end
	end

end
