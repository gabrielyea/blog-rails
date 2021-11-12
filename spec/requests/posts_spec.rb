require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    @test_user = User.create(name: 'bla',
                             photo: 'link',
                             bio: 'bla bla bla bla',
                             post_counter: 0)

    @test_post = Post.create(title: 'title', text: 'text', author_id: @test_user.id, comments_counter: 0,
                             likes_counter: 0)
    describe 'GET users/index/posts' do
      before { get user_posts_path(@test_user) }
      it 'is a success' do
        expect(response).to have_http_status(:ok)
      end
      it "renders 'index' template" do
        expect(response).to render_template('index')
      end
    end

    describe 'GET users/index/posts/1' do
      before { get user_post_path(@test_user, @test_post) }
      it 'is a success' do
        expect(response).to have_http_status(:ok)
      end
      it "renders 'show' template" do
        expect(response).to render_template('show')
      end
    end
  end
end
