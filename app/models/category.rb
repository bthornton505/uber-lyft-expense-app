class Category < ActiveRecord::Base
  has_many :expense_categories
  has_many :expenses, through: :expense_categories
end
