class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    user = current_user
    post = Post.find(params[:id])

    Like.create(author_id: current_user.id, post_id: post.id)

    if Like.exists?(author_id: current_user.id)
      flash[:notice] = 'Like saved!'
    else
      flash[:error] = 'Ups something went wrong!'
    end
    redirect_to user_post_path(user, post)
  end

  def already_liked?
    Like.where(author_id: @user.id, id: @post.id).exists?
  end
end
