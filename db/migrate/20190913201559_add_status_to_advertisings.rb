class AddStatusToAdvertisings < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisings, :status, :string
  end
end
