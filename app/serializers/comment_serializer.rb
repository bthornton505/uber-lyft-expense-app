class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :expense_id
  belongs_to :expense
end
