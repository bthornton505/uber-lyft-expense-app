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

# Creates Users
User.create(name: 'Brenden', password: 'taxdriver')

# Create Reports
ExpenseReport.create(month: 'November', year: 2018, user_id: 1)
ExpenseReport.create(month: 'December', year: 2018, user_id: 1)
ExpenseReport.create(month: 'January', year: 2019, user_id: 1)
ExpenseReport.create(month: 'February', year: 2019, user_id: 1)
ExpenseReport.create(month: 'March', year: 2019, user_id: 1)

# Create Expenses
Expense.create(month: 'November', cost: 100, category_id: 1, expense_report_id: 1)
Expense.create(month: 'November', cost: 237, category_id: 3, expense_report_id: 1)
Expense.create(month: 'November', cost: 130, category_id: 2, expense_report_id: 1)

Expense.create(month: 'December', cost: 100, category_id: 1, expense_report_id: 2)
Expense.create(month: 'December', cost: 237, category_id: 3, expense_report_id: 2)
Expense.create(month: 'December', cost: 130, category_id: 2, expense_report_id: 2)

Expense.create(month: 'January', cost: 100, category_id: 1, expense_report_id: 3)
Expense.create(month: 'January', cost: 237, category_id: 3, expense_report_id: 3)
Expense.create(month: 'January', cost: 130, category_id: 2, expense_report_id: 3)

Expense.create(month: 'February', cost: 100, category_id: 1, expense_report_id: 4)
Expense.create(month: 'February', cost: 237, category_id: 3, expense_report_id: 4)
Expense.create(month: 'February', cost: 130, category_id: 2, expense_report_id: 4)

Expense.create(month: 'March', cost: 100, category_id: 1, expense_report_id: 5)
Expense.create(month: 'March', cost: 237, category_id: 3, expense_report_id: 5)
Expense.create(month: 'March', cost: 130, category_id: 2, expense_report_id: 5)

# Create Comments 
Comment.create(description: 'Gas for the month', expense_id: 1)
Comment.create(description: 'Paid to Suntrust Bank', expense_id: 2)
Comment.create(description: 'Geico payment', expense_id: 3)

Comment.create(description: 'Gas for the month', expense_id: 4)
Comment.create(description: 'Paid to Suntrust Bank', expense_id: 5)
Comment.create(description: 'Geico payment', expense_id: 6)

Comment.create(description: 'Gas for the month', expense_id: 7)
Comment.create(description: 'Paid to Suntrust Bank', expense_id: 8)
Comment.create(description: 'Geico payment', expense_id: 9)

Comment.create(description: 'Gas for the month', expense_id: 10)
Comment.create(description: 'Paid to Suntrust Bank', expense_id: 11)
Comment.create(description: 'Geico payment', expense_id: 12)

Comment.create(description: 'Gas for the month', expense_id: 13)
Comment.create(description: 'Paid to Suntrust Bank', expense_id: 14)
Comment.create(description: 'Geico payment', expense_id: 15)
