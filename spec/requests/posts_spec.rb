require 'rails_helper'

describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'Emi', photo: 'https://picsum.photos/100', bio: 'Football player') }
  let!(:post) do
    Post.create(author_id: user.id, title: 'My life in football',
                text: 'I am a player in the youth category for the Linces FBA team in the receiver position.')
  end
  describe 'GET #index' do
    before :each do
      get user_posts_path(user.id)
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
      expect(response.body).to include('My life in football')
    end
  end

  describe 'GET #show each user posts' do
    before :each do
      get user_post_path(post.author_id, post.id)
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
      expect(response.body).to include('Post')
    end
  end
end
