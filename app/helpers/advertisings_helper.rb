# frozen_string_literal: true

module AdvertisingsHelper
  def get_advertisings_types(advertisings_types)
    advertisings_types.map { |t| [t.name, t.id] }
  end
end
