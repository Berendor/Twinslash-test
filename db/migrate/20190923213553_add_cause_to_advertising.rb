class AddCauseToAdvertising < ActiveRecord::Migration[5.2]
  def change
      add_column :advertisings, :cause, :text
  end
end
