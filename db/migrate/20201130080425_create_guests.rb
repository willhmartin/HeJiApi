class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.boolean :is_admin
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
