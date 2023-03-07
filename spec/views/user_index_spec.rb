require 'rails_helper'

RSpec.describe 'visit the user home page', type: :system do
  describe 'user index page' do
    before(:each) do
      @user1 = User.create(name: 'Isaie',
                           photo: 'https://www.smashbros.com/wiiu-3ds/images/character/toon_link/main.png',
                           bio: 'Engineer',
                           post_counter: 0)
      @user2 = User.create(name: 'Eliane',
                           photo: 'https://www.smashbros.com/wiiu-3ds/images/character/lucina/main.png',
                           bio: 'Tel engineer',
                           post_counter: 0)
      visit root_path
    end
    it 'shows the correct names for each user' do
        expect(page).to have_content('Isaie')
        expect(page).to have_content('Eliane')
      end
    it 'shows the profile picture for each user' do
      expect(page).to have_xpath("//img[contains(@src,'https://www.smashbros.com/wiiu-3ds/images/character/toon_link/main.png')]")
      expect(page).to have_xpath("//img[contains(@src,'https://www.smashbros.com/wiiu-3ds/images/character/lucina/main.png')]")
    end
    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link('Isaie', match: :first)
      expect(page).to have_current_path user_path(@user1)
    end
    it 'shows the number of posts each user has written' do
      expect(page).to have_content('Number of posts: ')
    end
  end
end
