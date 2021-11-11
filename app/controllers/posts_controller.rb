class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    cu = current_user
    @user = User.find(params[:user_id])
    @post = @user.posts.new(params.require(:post).permit(:title, :text))
    @post.author = cu

    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def like
    user = User.find(params[:user_id])
    post = user.posts.find(params[:id])
    Like.create(author_id: current_user.id, post_id: post.id)
    redirect_to user_post_path(user, post)
  end
end
