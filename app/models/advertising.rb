class Advertising < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :user_id, presence: true
  validates :title, presence: true,
                    length: { minimum: 2 }

end
