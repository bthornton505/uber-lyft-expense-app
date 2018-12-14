class ExpenseReportsController < ApplicationController

  def index
    @expense_reports = ExpenseReport.all 
  end

  def new
    @expense_report = ExpenseReport.new
  end

  def create
    @expense_report = ExpenseReport.create(expense_report_params)
    binding.pry
    if @expense_report.valid?
      flash[:message] = "Successfully created new expense report!"
      redirect_to user_expense_report_path(@expense_report)
    else
      render :new
    end

  end


  private

  def expense_report_params
    params.require(:expense_report).permit(:month, :year, :user_id)
  end
end
