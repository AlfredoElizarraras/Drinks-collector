# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  let(:user_1) do
    User.create(name: 'Author test',
                email: 'author_test@mail.com',
                password: '123456')
  end

  context 'Users relation with drinks:' do
    it 'users can create many drinks.' do
      u = User.reflect_on_association(:drinks)
      expect(u.macro).to eq(:has_many)
    end
  end

  context 'Users relation with Groups:' do
    it 'users can create many groups' do
      u = User.reflect_on_association(:groups)
      expect(u.macro).to eq(:has_many)
    end
  end

  context 'When a user is created' do
    it 'Is not valid if doesn\'t have a name ' do
      user.name = nil
      user.email = 'user@mail.com'
      user.password = '123456'
      expect(user).to_not be_valid
    end

    it 'Is not valid if doesn\'t have an email ' do
      user.email = nil
      user.name = 'user'
      user.password = '123456'
      expect(user).to_not be_valid
    end

    it 'Is not valid if doesn\'t have a password ' do
      user.email = 'user@mail.com'
      user.name = 'user'
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'Is only valid if it have a name, an email and a password' do
      user.email = 'user@mail.com'
      user.name = 'user'
      user.password = '123456'
      expect(user).to be_valid
    end
  end
end
