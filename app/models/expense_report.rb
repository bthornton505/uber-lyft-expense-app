class ExpenseReport < ActiveRecord::Base
  has_many :expenses
  belongs_to :user

  scope :by_chronological_order, -> { order(year: :asc)} 

end
