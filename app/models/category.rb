class Category < ActiveRecord::Base
  has_many :comments
  has_many :expenses, through: :comments

end
