# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe Drink, type: :model do
  let(:drink) { Drink.new }
  let(:author) do
    User.create(name: 'Author test',
                email: 'author_test@mail.com',
                password: '123456')
  end

  context 'Drinks relation with Users:' do
    it 'is created by a user' do
      drink = Drink.reflect_on_association(:author)
      expect(drink.macro).to eq(:belongs_to)
    end
  end

  context 'Drinks relation with Groups:' do
    it 'groups can have many drinks' do
      drink = Drink.reflect_on_association(:group)
      expect(drink.macro).to eq(:belongs_to)
    end
  end

  context 'When a drink is created' do
    it 'Is not valid if doesn\'t have a name ' do
      drink.name = nil
      drink.amount = 760
      drink.author_id = author.id
      expect(drink).to_not be_valid
    end

    it 'Is not valid if doesn\'t have an amount ' do
      drink.amount = nil
      drink.name = 'Drink'
      drink.author_id = author.id
      expect(drink).to_not be_valid
    end

    it 'Is not valid if doesn\'t have a author ' do
      drink.amount = 760
      drink.name = 'Drink'
      drink.author_id = nil
      expect(drink).to_not be_valid
    end

    it 'Is only valid if at least have a name, a amount and an author' do
      drink.amount = 760
      drink.name = 'Drink'
      drink.author_id = author.id
      expect(drink).to be_valid
    end

    it 'It can belongs to a group' do
      group = Group.create(name: 'Group test', icon: '', user_id: author.id)
      drink.amount = 760
      drink.name = 'Drink'
      drink.author_id = author.id
      drink.group_id = group.id
      expect(drink).to be_valid
    end
  end
end
# rubocop:enable Metrics/BlockLength
