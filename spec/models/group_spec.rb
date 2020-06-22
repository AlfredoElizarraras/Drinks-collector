# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { Group.new }
  let(:user) do
    User.create(name: 'user test',
                email: 'user_test@mail.com',
                password: '123456')
  end

  context 'Group relation with Users:' do
    it 'is created by a user' do
      group = Group.reflect_on_association(:user)
      expect(group.macro).to eq(:belongs_to)
    end
  end

  context 'Groups relation with drinks:' do
    it 'groups can have many drinks' do
      group = Group.reflect_on_association(:drinks)
      expect(group.macro).to eq(:has_many)
    end
  end

  context 'When a group is created' do
    it 'It is not valid if doesn\'t have a name ' do
      group.name = nil
      group.user_id = user.id
      expect(group).to_not be_valid
    end

    it 'It is not valid if doesn\'t have a user ' do
      group.name = 'group'
      group.user_id = nil
      expect(group).to_not be_valid
    end

    it 'Is only valid if at least have a name and an user' do
      group.name = 'group'
      group.user_id = user.id
      expect(group).to be_valid
    end
  end
end
