class RemoveUserIdFromTrips < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :user_id, :string
  end
end
