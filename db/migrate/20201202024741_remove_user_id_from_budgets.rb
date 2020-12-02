class RemoveUserIdFromBudgets < ActiveRecord::Migration[6.0]
  def change
    remove_column :budgets, :user_id, :string
  end
end
