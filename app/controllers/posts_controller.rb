class PostsController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_user!, only: %i[new create delete]

  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    cu = current_user
    @post_user = User.find(params[:user_id])
    @post = cu.posts.new(params.require(:post).permit(:title, :text))
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:notice] = 'Post saved!!'
      redirect_to user_post_path(cu, @post)
    else
      flash[:error] = @post.errors.full_messages[0]
      redirect_to new_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
end
