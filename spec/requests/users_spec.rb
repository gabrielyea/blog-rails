require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @test_user = User.create(name: 'bla',
                             photo: 'link',
                             bio: 'bla bla bla bla',
                             post_counter: 0)
    describe 'GET /index' do
      before { get users_path }
      it 'is a success' do
        expect(response).to have_http_status(:ok)
      end
      it "renders 'index' template" do
        expect(response).to render_template('index')
      end
    end

    describe 'GET /index/id' do
      before { get user_path(@test_user) }
      it 'is a success' do
        expect(response).to have_http_status(:ok)
      end
      it "renders 'show' template" do
        expect(response).to render_template('show')
      end
    end
  end
end
