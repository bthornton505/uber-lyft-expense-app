class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :month, :cost, :expense_report_id, :category, :comments
  belongs_to :expense_report
  
end
