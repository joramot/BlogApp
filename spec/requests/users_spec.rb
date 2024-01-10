require 'rails_helper'

require 'pry'

describe 'Users', type: :request do

  let!(:user) { User.create(name: 'Peter', photo: 'https://picsum.photos/100', bio: 'Football player') }
  let!(:post) do
    Post.create(title: 'My life in football', text: 'I am a player in the youth category for the Linces FBA team.',
                author_id: user.id)
  end

  describe 'GET #index' do
    before :each do
      get users_path
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
    it 'check if the response body includes the correct placeholder text' do
      expect(response.body).to include('Peter')
    end
  end

  describe 'GET #show' do
    before :each do
      get user_path(user.id)
    end

    # If response status was correct.
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    # If a correct template was rendered.
    it 'check if the correct template was rendered' do
      expect(response).to render_template(:show)
    end

    # If the response body includes correct placeholder text.
    it 'check if the response boby includes the correct placeholder text' do
      expect(response.body).to include('User')
    end
  end
end
