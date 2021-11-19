require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 10, author_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { posts.first.id }
  let(:headers) { valid_headers }

  describe 'GET /api/posts' do
    before do
      get "/api/users/#{user_id}/posts", params: {}, headers: headers
    end

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end
