require 'rails_helper'

describe 'Users Post Index', type: :feature do
  before :each do
    @author1 = User.create(name: 'Peter Emi', photo: 'https://picsum.photos/100', bio: 'Martial Artist')
    @author2 = User.create(name: 'Tony', photo: 'https://picsum.photos/100', bio: 'Monk of the mountains')
    @post1 = Post.create(author_id: @author1.id, title: 'My life in football',
                         text: 'I am a player in the youth category for the Linces FBA team.')
    @post2 = Post.create(author_id: @author1.id, title: 'The beginning as a swimmer',
                         text: 'training for university selection')
    @post3 = Post.create(author_id: @author1.id, title: 'My favorite style', text: 'I am better at breaststroke style')
    Comment.create(user_id: @author2.id, post_id: @post1.id, text: 'I like this post')
    Comment.create(user_id: @author1.id, post_id: @post1.id, text: 'Thanks!')
    Like.create(user_id: @author2.id, post_id: @post1.id)
    Like.create(user_id: @author1.id, post_id: @post1.id)
    visit user_posts_path(@author1.id)
  end

  scenario "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://picsum.photos/100']")
  end

  scenario "I can see the user's username" do
    expect(page).to have_content('Peter Emi')
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 3')
  end

  scenario "I can see a post's title" do
    expect(page).to have_content('My life in football')
  end

  scenario "I can see some of the post's body" do
    expect(page).to have_content('I am a player in the youth category for the Linces FBA team.')
  end

  scenario 'I can see the first comments on a post' do
    expect(page).to have_content('I like this post')
  end

  scenario 'I can see how many comments a post has' do
    expect(page).to have_content('Comments: 2')
  end

  scenario 'I can see how many likes a post has' do
    expect(page).to have_content('Likes: 2')
  end

  scenario "When I click on a post, it redirects me to that post's show page" do
    click_on('My life in football')
    expect(page).to have_content('I am a player in the youth category for the Linces FBA team.')
  end

  scenario 'I can see the pagination if there are more then 3 posts but not if I have less' do
    expect(page).to have_no_content('See all posts')
    @post4 = Post.create(author_id: @author1.id, title: 'The way of the Fire', text: 'Fire is the way of the strong')
    click_on('Back')
    expect(page).to have_content('See all posts')
  end
end
