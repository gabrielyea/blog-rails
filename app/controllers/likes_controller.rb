class LikesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    post = user.posts.find(params[:id])
    Like.create(author_id: current_user.id, post_id: post.id)
    if Like.exists?(author_id: current_user.id)
      flash[:notice] = 'Like saved!'
    else
      flash[:error] = 'Ups something went wrong!'
    end
    redirect_to user_post_path(user, post)
  end
end
