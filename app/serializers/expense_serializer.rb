class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :month, :cost, :expense_report_id
  belongs_to :expense_report
  has_many :comments
  has_many :categories, serializer: CommentSerializer
end
