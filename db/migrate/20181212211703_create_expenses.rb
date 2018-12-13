class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :month
      t.integer :cost
      t.integer :expense_report_id

      t.timestamps
    end
  end
end
