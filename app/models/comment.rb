class Comment < ActiveRecord::Base
  belongs_to :expense
  belongs_to :category

  validates :description, presence: true 
end
