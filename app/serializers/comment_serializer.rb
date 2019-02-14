class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :expense_id, :category_id
  belongs_to :expense
  belongs_to :category
end
