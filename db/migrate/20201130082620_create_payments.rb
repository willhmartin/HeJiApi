class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :category
      t.text :content
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
