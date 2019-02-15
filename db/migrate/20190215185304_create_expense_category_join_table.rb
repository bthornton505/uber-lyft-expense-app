class CreateExpenseCategoryJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_expenses, id: false do |t|
      t.belongs_to :expense, index: true
      t.belongs_to :category, index: true
    end
  end
end
