class Advertising < ApplicationRecord

  include PgSearch
  pg_search_scope :search_by_title_and_text, :against => [:title, :text],
                   using: {:tsearch => {:prefix => true}}


  belongs_to :user
  has_many_attached :images
  validates :user_id, presence: true
  validates :title, presence: true,
                    length: { minimum: 2 }
  extend Enumerize
  enumerize :status, in: [:draft, :new, :rejected,
                          :approved, :published, :archival], default: :draft

end
