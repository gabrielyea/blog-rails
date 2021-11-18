require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
  describe 'user show page' do
    before :all do
      user = User.new(
        email: 'admin@gmail.com',
        bio: 'Richie is my partner',
        password: 'password',
        password_confirmation: 'password',
        name: 'Admin',
        role: 'admin'
      )
      user.skip_confirmation!
      user.save!

      (1..3).each do |id|
        Post.create(
          id: id,
          author_id: 1,
          title: "Richie' Post #{id}",
          text: 'Richie was here. The Richie',
          comments_counter: 0,
          likes_counter: 0
        )
      end
    end

    it "user_path show an user's picture" do
      visit user_path(1)
      expect(page).to have_css('img', class: 'img_profile')
    end

    it 'user_path show name of users' do
      visit user_path(1)
      expect(page).to have_content('Admin')
    end

    it "user_path show the correct user's post_counter" do
      visit user_path(1)
      expect(page).to have_content('3')
    end

    it "user_path show the correct user's bio" do
      visit user_path(1)
      expect(page).to have_content('Richie is my partner')
    end

    it 'user_path shows the 3 recent posts' do
      visit user_path(1)
      expect(page).to have_content("Richie' Post 1")
      expect(page).to have_content("Richie' Post 2")
      expect(page).to have_content("Richie' Post 3")
    end

    it "When I click on a user, I am redirected to that user's show page." do
      visit user_path(1)
      expect(has_link?('See all posts')).to be(true)
    end

    it "When I click a user's post, it redirects me to that post's show page." do
      visit user_path(1)
      click_link("Richie' Post 1")
      expect(page).to have_current_path(user_post_path(1, 1))
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      visit user_path(1)
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(1))
    end
  end
end
