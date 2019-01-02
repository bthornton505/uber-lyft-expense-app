# This creates the categories a user can pick from
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

#This creates the months a user can pick from for expense reports
# expense_report_months = [
#   "January",
#   "February",
#   "March",
#   "April",
#   "May",
#   "June",
#   "July",
#   "August",
#   "September",
#   "October",
#   "November",
#   "December"
# ]
#
# expense_report_months.each do |month|
#   ExpenseReport.create( month: month )
# end
#
# expense_report_years = [
#   2017,
#   2018,
#   2019,
#   2020,
#   2021,
#   2022,
#   2023,
#   2024,
#   2025,
#   2026
# ]
#
# expense_report_years.each do |year|
#   ExpenseReport.create( year: year )
# end

# This creates expense months a user can pick from
# expense_months = [
#   "January",
#   "February",
#   "March",
#   "April",
#   "May",
#   "June",
#   "July",
#   "August",
#   "September",
#   "October",
#   "November",
#   "December"
# ]
#
# expense_months.each do |month|
#   Expense.create( month: month )
# end
