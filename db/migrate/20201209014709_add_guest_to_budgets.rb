class AddGuestToBudgets < ActiveRecord::Migration[6.0]
  def change
    remove_column :budgets, :guest_id, :string
    add_reference :budgets, :guest
  end
end


