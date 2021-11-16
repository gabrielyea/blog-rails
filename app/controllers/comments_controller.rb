class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @user = current_user
    @comment = @user.comments.new((params.require(:comment).permit(:text)))
    @comment.author_id = @user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:notice] = 'Comment saved!'
      redirect_to user_post_path(@user, Post.find(params[:post_id]))
    else
      flash[:error] = @comment.errors.messages
      render :new
    end
  end
end
