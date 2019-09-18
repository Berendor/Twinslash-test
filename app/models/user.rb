class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend Enumerize
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :advertisings

  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false },
  format: { with: VALID_EMAIL_REGEX }

  before_save { self.email = email.downcase }

  enumerize :role, in: [:user, :admin, :unlogged], default: :user

end
