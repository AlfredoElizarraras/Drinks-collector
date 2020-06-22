# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github google_oauth2 facebook]
  has_many :drinks, dependent: :destroy, foreign_key: :author_id
  has_many :groups
  validates :name, presence: true

  def sum_drinks(grouped = true)
    if grouped
      drinks.where.not(group_id: nil).sum(:amount).to_f
    else
      drinks.where(group_id: nil).sum(:amount).to_f
    end
  end

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
    user.provider = auth.provider
    user.uid = auth.uid
    user.gravatar_url = auth.info.image
    user.save
    user
  end
end
