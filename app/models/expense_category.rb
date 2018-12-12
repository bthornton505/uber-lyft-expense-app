class ExpenseCategory < ActiveRecord::Base
  belongs_to :expense
  belongs_to :category 
end
