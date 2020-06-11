class Drink < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  scope :by_user, lambda { |author_id|
    Drink.where(author_id: author_id).order(created_at: :desc) if !author_id.nil?
  }
end
