class AddGuestIdToBudgets < ActiveRecord::Migration[6.0]
  def change
    add_column :budgets, :guest_id, :string
  end
end
