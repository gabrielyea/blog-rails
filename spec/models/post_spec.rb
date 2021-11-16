require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(name: 'Gabriel',
                        photo: 'linktophoto',
                        bio: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
      bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
      bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                        post_counter: 0)
    @post = Post.create(author_id: @user.id, title: 'Title 1',
                        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus eros euismod,
                         ullamcorper magna vel, pellentesque metus. Sed id cursus lorem.',
                        comments_counter: 1, likes_counter: 1)
  end

  it 'should be invalid with no title' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'should be invalid with long title' do
    @post.title = "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
                  bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
                  bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
                  bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
                  bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
                  bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla"
    expect(@post).to_not be_valid
  end

  it 'should be invalid with no counter' do
    @post.comments_counter = nil
    expect(@post).to_not be_valid
  end

  it 'should be invalid with negative values' do
    @post.comments_counter = -10
    expect(@post).to_not be_valid
  end

  it 'should be invalid with no likes counter' do
    @post.likes_counter = nil
    expect(@post).to_not be_valid
  end

  it 'should be invalid with negative values' do
    @post.likes_counter = -20
    expect(@post).to_not be_valid
  end

  it 'update post_counter method should update the post counter' do
    Post.create(title: 'title', text: 'text', author_id: @user.id, comments_counter: 0, likes_counter: 0)
    @user.posts.new(title: 'title', text: 'text', author_id: @user.id, comments_counter: 0, likes_counter: 0).save

    expect(@user.posts.length).to be(1)
  end
end
