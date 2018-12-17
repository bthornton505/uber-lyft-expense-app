class ExpensesController < ApplicationController

  def new
    @expense_report = ExpenseReport.find(params[:expense_report_id])
    @expense = Expense.new(:expense_report => @expense_report)
  end

end
