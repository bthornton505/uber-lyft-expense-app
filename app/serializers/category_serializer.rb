class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :expenses
  
end
