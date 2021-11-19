class Api::CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:post_id])
    @comments = @posts.comments
    render json: @comments
  end

  def create
    user = current_user
    comment = Comment.new(comment_params)
    comment.author = user
    response = if comment.save
                 { comment: comment }
               else
                 { message: "comment didn't save" }
               end
    json_response(response)
  end

  private

  def comment_params
    params.permit(
      :text,
      :post_id
    )
  end
end
