# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :drinks
  belongs_to :user
  validates :name, presence: true

  scope :by_user, lambda { |user_id|
    Group.where(user_id: user_id).order(name: :asc).includes(:drinks)
  }
end
