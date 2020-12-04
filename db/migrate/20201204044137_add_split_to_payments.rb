class AddSplitToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :split, :boolean
  end
end
