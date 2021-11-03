require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET users/index/posts' do
    before { get '/users/1/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'body has the correct text' do
      expect(response.body).to include('List of all posts for a single users')
    end
  end

  describe 'GET users/index/posts/1' do
    before { get '/users/1/posts/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'body has the correct text' do
      expect(response.body).to include('List a single post from a user')
    end
  end
end
