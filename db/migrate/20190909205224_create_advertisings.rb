# frozen_string_literal: true

class CreateAdvertisings < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisings do |t|
      t.string :title
      t.text :text
      t.belongs_to :advertisings_type
      t.timestamps
    end
  end
end
