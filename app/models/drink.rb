# frozen_string_literal: true

class Drink < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :amount, presence: true

  scope :by_user, lambda { |author_id, grouped_ones = true|
    unless author_id.nil?
      if grouped_ones
        where(author_id: author_id).where.not(group_id: nil).order(created_at: :desc).includes(:group)
      else
        where(author_id: author_id).where(group_id: nil).order(created_at: :desc)
      end
    end
  }
end
