require 'rails_helper'

RSpec.describe 'Users Index', type: :feature do
  before :each do
    author1 = User.create(name: 'Peter', photo: 'https://picsum.photos/100', bio: 'Football player')
    author2 = User.create(name: 'Tony', photo: 'https://picsum.photos/100', bio: 'Swimmer amateur')
    Post.create(title: 'My life in football', text: 'I am a player in the youth category for the Linces FBA team.',
                author_id: author1.id)
    Post.create(title: 'The beginning as a swimmer',
                text: 'training for university selection',
                author_id: author2.id)
    Post.create(title: 'My favorite style',
                text: 'I am better at breaststroke style',
                author_id: author2.id)
    Comment.create(user_id: author1.id, post_id: author2.posts.first.id, text: 'I like this post')
  end

  scenario 'I can see the username of all other users' do
    visit users_path
    expect(page).to have_content('Peter')
    expect(page).to have_content('Tony')
  end

  scenario 'I can see the profile picture for each user' do
    visit users_path
    expect(page).to have_css("img[src*='https://picsum.photos/100']")
    expect(page).to have_css("img[src*='https://picsum.photos/100']")
  end

  scenario 'I can see the number of posts each user has written' do
    visit users_path
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Number of posts: 2')
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    visit users_path
    click_link 'Peter'
    expect(page).to have_content('Peter')
    expect(page).to have_content('Football player')
    expect(page).to have_content('My life in football')
  end
end
