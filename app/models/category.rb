class Category < ActiveRecord::Base
  # Categories will no longer have comments associated with it, only expenses
  has_many :comments
  # This will change to a belongs_to relationship
  has_many :expenses, through: :comments

end
