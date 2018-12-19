class RenameExpenseCategoriesToComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :expense_categories, :comments
  end
end
