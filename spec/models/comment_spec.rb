require 'rails_helper'
RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.new(name: 'bla', photo: 'photo',
                     bio: 'bla bla bla bla',
                     post_counter: 0)
    @user.save
    @post = Post.create(id: 1, author_id: @user.id, title: 'Title',
                        text: 'bla bla bla bla',
                        comments_counter: 1, likes_counter: 0)
    @comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'Comment')
  end
  it 'create comment should create a new comment' do
    @comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'Comment')
    expect(@comment.text).to eq('Comment')
  end
  it 'update_comments_counter method should update the comments counter of a post' do
    @post.comments.new(author_id: 3, post_id: 2, text: 'Comment 2').save
    expect(@post.comments_counter).to be(1)
  end
end
