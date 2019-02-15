class AddExpenseIdToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :expense_id, :integer  
  end
end
