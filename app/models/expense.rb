class Expense < ActiveRecord::Base
  belongs_to :expense_report
  has_many :expense_categories
  has_many :categories, through: :expense_categories

end
