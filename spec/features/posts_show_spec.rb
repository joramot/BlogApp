require 'rails_helper'

describe 'Post show page', type: :feature do
  before :each do
    user1 = User.create(name: 'Jose', photo: 'https://picsum.photos/100', bio: 'Full Stack Developer')
    user2 = User.create(name: 'Peter Emi', photo: 'https://picsum.photos/100', bio: 'Football player')
    user3 = User.create(name: 'Tony', photo: 'https://picsum.photos/100', bio: 'Swimmer amateur')
    post = Post.create(author_id: user1.id, title: 'Full Stack technologys',
                       text: 'Principal technologies Full Stack: JavaScript, HTML5 & CSS3')
    Comment.create(user_id: user2.id, post_id: post.id,
                   text: 'I like this post')
    Comment.create(user_id: user3.id, post_id: post.id, text: 'me too!')
    Like.create(user_id: user1.id, post_id: post.id)
    Like.create(user_id: user2.id, post_id: post.id)
    visit user_posts_path(user1.id, post.id)
  end

  scenario "I can see the post's title " do
    expect(page).to have_content('Full Stack technologys')
  end

  scenario 'I can see who wrote the post' do
    expect(page).to have_content('Jose')
  end

  scenario 'I can see how many comments it has.' do
    expect(page).to have_content('Comments: 2')
  end

  scenario 'I can see how many likes it has.' do
    expect(page).to have_content('Likes: 2')
  end

  scenario 'I can see the post body.' do
    expect(page).to have_content('Principal technologies Full Stack: JavaScript, HTML5 & CSS3')
  end

  scenario 'I can see the username of each commentor.' do
    expect(page).to have_content('Peter Emi')
    expect(page).to have_content('Tony')
  end

  scenario 'I can see the comment each commentor left.' do
    expect(page).to have_content('I like this post')
    expect(page).to have_content('me too!')
  end
end
