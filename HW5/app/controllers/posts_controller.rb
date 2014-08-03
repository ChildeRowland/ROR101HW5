class PostsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
	end

	def show
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])
	end

	def new
		@user = User.find(params[:user_id])
		@post = @user.posts.new(params[:post])
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.new(post_params)
		if @post.save
			flash[:notice] = "New Post Added"
			redirect_to user_path @user
		else
			flash[:notice] = "Post not added"
			redirect_to user_path @user
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])

		if @post.update_attributes(post_params)
			flash[:notice] = "Post Updated"
			redirect_to user_posts_path
		else
			flash[:notice] = "Something Went Wrong"
			redirect_to new_user_posts_path
		end
	end

	def destroy
		if Post.find(params[:id]).delete
			flash[:notice] = "Post Deleted"
			redirect_to user_posts_path
		else
			flash[:notice] = "someting Went Wrong"
			redirect_to user_posts_path
		end
	end

	private   
	def post_params     
		params.require(:post).permit(:title, :body)
	end

end
