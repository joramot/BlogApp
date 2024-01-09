require 'rails_helper'

describe 'Users Show', type: :feature do
  let :user do
    User.create(name: 'Emi', photo: 'https://picsum.photos/100', bio: 'Football player')
  end

  let! :post1 do
    Post.create(author_id: user.id, title: 'My life in football',
                text: 'I am a player in the youth category for the Linces FBA team in the receiver position.')
  end

  let! :post2 do
    Post.create(author_id: user.id, title: 'Receiver wing position',
                text: 'The wing receiver position requires a lot of strength and speed, it is a key position in the offense.')
  end

  let! :post3 do
    Post.create(author_id: user.id, title: 'Next season', text: 'The next spring summer 2024 season will be the opportunity to improve my statistics.')
  end

  let! :comment1 do
    Comment.create(user_id: user.id, post_id: post1.id, text: 'I like this post')
  end

  before { visit user_path(user) }

  scenario "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://picsum.photos/100']")
  end

  scenario "I can see the user's username" do
    expect(page).to have_content('Emi')
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 3')
  end

  scenario "I can see the user's bio" do
    expect(page).to have_content('Football player')
  end

  scenario "I can see the user's first 3 posts" do
    expect(page).to have_content('My life in football')
    expect(page).to have_content('Receiver wing position')
    expect(page).to have_content('Next season')
  end
end
