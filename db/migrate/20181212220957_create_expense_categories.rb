class CreateExpenseCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_categories do |t|
      t.string :note 
      t.integer :expense_id
      t.integer :category_id
    end
  end
end
