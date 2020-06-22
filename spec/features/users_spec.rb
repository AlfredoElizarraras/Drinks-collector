# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'Sign up for a new user:' do
    scenario 'should be succeful' do
      visit root_path
      click_link 'Sign up'
      within('form') do
        fill_in 'user_name', with: 'User 1 test'
        fill_in 'user_email', with: 'user_1_test@mail.com'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('User 1 test')
    end
  end

  context 'Sign in for a created user:' do
    before(:each) { User.create(name: 'User 1 test', email: 'user_1_test@mail.com', password: '123456') }
    scenario 'should be succeful' do
      visit root_path
      within('form') do
        fill_in 'user_email', with: 'user_1_test@mail.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content('User 1 test')
    end
  end

  context 'Create new group' do
    before(:each) do
      User.create(name: 'User 1 test', email: 'user_1_test@mail.com', password: '123456')
      visit root_path
      within('form') do
        fill_in 'user_email', with: 'user_1_test@mail.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
    end

    scenario 'should be able to create new groups' do
      visit root_path
      click_link 'All my groups'
      click_link 'Create new'
      within('form') do
        fill_in 'group_name', with: 'Group test'
      end
      click_button 'Create new group'
      expect(page).to have_content('Group test')
    end
  end

  context 'Create new drink' do
    before(:each) do
      u = User.create(name: 'User 1 test', email: 'user_1_test@mail.com', password: '123456')
      g = Group.create(name: 'Group test', user_id: u.id)
      Drink.create(name: 'Drink test', amount: 760, author_id: u.id, group_id: g.id)
      visit root_path
      within('form') do
        fill_in 'user_email', with: 'user_1_test@mail.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
    end

    scenario 'should be able to create new drinks with group' do
      visit root_path
      click_link 'All my drinks'
      click_link 'Add new'
      within('form') do
        fill_in 'drink_name', with: 'drink test'
        fill_in 'drink_amount', with: 760
        select('Group test', from: 'drink_group_id')
      end
      click_button 'Add new drink'
      expect(page).to have_content('drink test')
    end

    scenario 'should be able to create new drinks without group' do
      visit root_path
      click_link 'All my drinks'
      click_link 'Add new'
      within('form') do
        fill_in 'drink_name', with: 'drink test'
        fill_in 'drink_amount', with: 760
      end
      click_button 'Add new drink'
      expect(page).to have_content('drink test')
    end

    scenario 'should be able to see total of his/her drinks' do
      visit root_path
      click_link 'All my drinks'
      expect(page).to have_content('760.0ml')
    end
  end
end
# rubocop:enable Metrics/BlockLength
