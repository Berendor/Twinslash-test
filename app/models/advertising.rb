class Advertising < ApplicationRecord
  has_many_attached :images
  validates :title, presence: true,
                    length: { minimum: 2 }

end
