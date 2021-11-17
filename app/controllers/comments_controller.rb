class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @user = current_user
    @comment = @user.comments.new((params.require(:comment).permit(:text)))
    @comment.author_id = @user.id
    @comment.post_id = params[:post_id]
    post = Post.find(params[:post_id])

    if @comment.save
      flash[:notice] = 'Comment saved!'
      redirect_to user_post_path(user_id: params[:user_id], id: post)
    else
      flash[:error] = @comment.errors.messages
      render :new
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.destroy
    redirect_to user_post_path(user_id: params[:user_id], id: post)
  end
end
