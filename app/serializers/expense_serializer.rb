class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :month, :cost, :expense_report_id, :category
  belongs_to :expense_report
  has_many :categories
end
