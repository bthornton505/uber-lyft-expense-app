class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :month, :cost, :expense_report_id, :category_id
  belongs_to :expense_report
  belongs_to :category
end
