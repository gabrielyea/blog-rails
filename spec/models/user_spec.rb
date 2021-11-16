require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Gabriel',
                        photo: 'linktophoto',
                        bio: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
      bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
      bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                        post_counter: 0)
    @user.save
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should return not valid with no number value for posts_counter' do
    @user.post_counter = nil
    expect(@user).to_not be_valid
  end

  it 'should return not valid with negative number' do
    @user.post_counter = -1
    expect(@user).to_not be_valid
  end
end

describe 'User' do
  before :each do
    @user = User.create(name: 'Gabriel',
                        photo: 'linktophoto',
                        bio: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
    bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
    bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                        post_counter: 0)
    @user.save
  end
  it 'shoud fail when default user tries to destroy' do
    @user.role = 'admin'
    @user.save
    ability = Ability.new(@user)
    expect(ability).to be_able_to(:destroy, Post.new(author: @user))
  end
  it 'should pass when default user tries to destroy' do
    @user.role = 'default'
    @user.save
    ability = Ability.new(@user)
    expect(ability).not_to be_able_to(:destroy, Post.new)
  end
end
