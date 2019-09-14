class AddAdvertisingsTypesToAdvertisings < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisings, :advertisings_type, :string
  end
end
