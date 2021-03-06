# frozen_string_literal: true

class Advertising < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_text, against: %i[title text],
                                             using: { tsearch: { prefix: true } }

  belongs_to :user
  belongs_to :advertisings_type
  has_many_attached :images
  validates :user_id, :text, :advertisings_type_id, presence: true
  validates :title, presence: true,
                    length: { minimum: 2 }
  extend Enumerize
  enumerize :status, in: %i[draft new rejected
                            approved published archival], default: :draft
end
