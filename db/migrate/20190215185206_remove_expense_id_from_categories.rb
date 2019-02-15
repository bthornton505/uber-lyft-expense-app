class RemoveExpenseIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :expense_id 
  end
end
