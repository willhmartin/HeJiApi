class AddTitleToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :title, :string
  end
end
