# frozen_string_literal: true

class AdvertisingsType < ApplicationRecord
  validates :name, uniqueness: true
  has_many :advertisings
end
