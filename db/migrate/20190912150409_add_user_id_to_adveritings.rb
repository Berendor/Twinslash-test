# frozen_string_literal: true

class AddUserIdToAdveritings < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisings, :user_id, :integer
  end
end
