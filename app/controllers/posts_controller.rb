class PostsController < ApplicationController
  def index
    @posts = Post.includes([:author])
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
    @post = cu.posts.new(params.require(:post).permit(:title, :text))
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:notice] = 'Post saved!'
      redirect_to user_post_path(cu, @post)
    else
      flash[:error] = @post.error.messages
      render :new
    end
  end
end
