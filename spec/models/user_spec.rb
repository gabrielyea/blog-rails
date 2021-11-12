require 'rails_helper'

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
