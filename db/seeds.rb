# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category_list  = [
  "Gas",
  "Car Insurance",
  "Car Payment", 
  "Maintenance",
  "Car Wash",
  "Phone Payment",
  "Miscellaneous"
]

category_list.each do |category|
  Category.create( name: category )
end
