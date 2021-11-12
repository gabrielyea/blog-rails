class CommentsController < ApplicationController
  def create
    cu = current_user
    this_user = User.find(params[:user_id])
    this_post = this_user.posts.find(params[:post_id])
    @comment = Comment.new((params.require(:comment).permit(:text)))
    @comment.post = this_post
    @comment.author = cu

    redirect_to user_post_path(this_user, this_post) if @comment.save
  end
end
