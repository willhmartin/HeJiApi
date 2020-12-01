class AddNameToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :name, :string
  end
end
