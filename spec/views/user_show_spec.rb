require 'rails_helper'

RSpec.describe 'visit the user home page', type: :system do
  before do
    @user1 = User.create(id: 5, name: 'Isaie', photo: 'https://randomuser.me/api/portraits/men/13.jpg',
                         bio: 'Web developer', post_counter: 0)
    @user2 = User.create(id: 6, name: 'Eliane', photo: 'https://randomuser.me/api/portraits/women/21.jpg',
                         bio: 'Telecom Engineer', post_counter: 0)
    @post1 = Post.create(author: @user1, title: 'My first post.', text: 'post description 1', comments_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(author: @user2, title: 'My second post.', text: 'post description 2', comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create(author: @user1, title: 'My third post.', text: 'post description 3', comments_counter: 0,
                         likes_counter: 0)
    Comment.create(post: @post1, author: @user2, text: 'hallo there')
    Comment.create(post: @post2, author: @user1, text: 'You look stunning')
  end

  it "should display the user's profile image" do
    visit "/users/#{@user1.id}"
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
  end

  it "should display the user's name" do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.name)
  end

  it 'should display number of posts from the user' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content("Number of posts: #{@user1.post_counter}")
  end

  it 'should display the user\'s bio ' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.bio)
  end

  it 'should display 2 recent posts' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post3.text)
  end

  it 'should redirect to the users profile page' do
    visit "/users/#{@user1.id}"
    click_button('See all posts')
    expect(page).to have_current_path("/users/#{@user1.id}")
  end
end
