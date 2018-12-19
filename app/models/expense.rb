class Expense < ActiveRecord::Base
  belongs_to :expense_report
  has_many :comments
  has_many :categories, through: :comments

end
