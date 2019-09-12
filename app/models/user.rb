class User < ApplicationRecord
  extend Enumerize
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :advertisings
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false },
  format: { with: VALID_EMAIL_REGEX }

  before_save { self.email = email.downcase }

  enumerize :role, in: [:user, :admin], default: :user

end
