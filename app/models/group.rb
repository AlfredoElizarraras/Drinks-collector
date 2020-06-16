# frozen_string_literal: true

class Group < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_many :drinks, dependent: :nullify
  belongs_to :user
  validates :name, presence: true
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: 'must be a valid image format' },
                    size: { less_than: 5.megabytes,
                            message: 'should be less than 5MB' }

  scope :by_user, lambda { |user_id|
    where(user_id: user_id).order(name: :asc).includes(:drinks)
  }

  def display_image
    image.variant(resize_to_limit: [300, 300])
  end
end
