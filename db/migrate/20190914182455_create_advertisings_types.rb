# frozen_string_literal: true

class CreateAdvertisingsTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisings_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
