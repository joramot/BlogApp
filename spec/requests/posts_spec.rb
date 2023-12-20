require 'rails_helper'

describe 'Posts', type: :request do
  describe 'GET #index each user posts' do
    before :each do
      get user_posts_path(1)
    end

    # If response status was correct.
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    # If a correct template was rendered.
    it 'check if the correct template was rendered' do
      expect(response).to render_template(:index)
    end

    # If the response body includes correct placeholder text.
    it 'check if the response boby includes the correct placeholder text' do
      expect(response.body).to include('Posts')
    end
  end
end
