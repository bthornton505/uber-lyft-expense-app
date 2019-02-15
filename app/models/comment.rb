class Comment < ActiveRecord::Base
  belongs_to :expense
  # Comment will no longer belong to a category
  # belongs_to :category

  validates :description, presence: true
end
