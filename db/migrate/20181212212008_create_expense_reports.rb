class CreateExpenseReports < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_reports do |t|
      t.string :month
      t.integer :year 
      t.integer :user_id

      t.timestamps
    end
  end
end
