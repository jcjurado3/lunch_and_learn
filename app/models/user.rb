class User < ApplicationRecord
  has_many :favorites
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_secure_password
  has_secure_token :api_key
end