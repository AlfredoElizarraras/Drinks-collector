# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :drinks, dependent: :nullify
  belongs_to :user
  validates :name, presence: true

  scope :by_user, lambda { |user_id|
    where(user_id: user_id).order(name: :asc).includes(:drinks)
  }
end
