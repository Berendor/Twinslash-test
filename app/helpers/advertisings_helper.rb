# frozen_string_literal: true

module AdvertisingsHelper
  def get_advertisings_types(advertisings_types)
    advertisings_types.map { |t| [t.name, t.id] }
  end

  def get_name_of_type(id)
    AdvertisingsType.all.each do |type|
      return type[:name] if type[:id] == id
    end
  end
end
