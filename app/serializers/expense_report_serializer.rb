class ExpenseReportSerializer < ActiveModel::Serializer
  attributes :id, :month, :year
  has_many :expenses
  
end
