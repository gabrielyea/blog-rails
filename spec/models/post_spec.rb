require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Gabriel',
                        photo: 'linktophoto',
                        bio: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
                        bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
                        bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                        post_counter: 0)
    @post = Post.new(title: 'title', text: 'text', author_id: @user.id, comments_counter: 0, likes_counter: 0)
    @post.save
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
end
