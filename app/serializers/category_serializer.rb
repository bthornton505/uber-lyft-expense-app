class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :expenses
  has_many :comments
end
