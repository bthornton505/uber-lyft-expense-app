class Category < ActiveRecord::Base
  has_many :comments
  has_many :expenses, through: :comments

# I want to hard code the possible categories but still have them persist to the category table

  # CATEGORIES = [
  #   "Gas",
  #   "Miles",
  #   "Car Insurance",
  #   "Car Payment",
  #   "Car Wash",
  #   "Maintenance",
  #   "Phone Payment",
  #   "Miscellaneous"
  # ]

end
