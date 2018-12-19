class ExpensesController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @expense = Expense.find_by(id: params[:id])
  end

  def new
    @expense_report = ExpenseReport.find(params[:expense_report_id])
    @expense = Expense.new(:expense_report => @expense_report)
    @category = Category.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense_report = ExpenseReport.find(params[:expense_report_id])

    if @expense.save
      flash[:message] = "Successfully created new expense"
      redirect_to expense_report_path(@expense_report)
    else
      render :new
    end

  end


  private

  def expense_params
    params.require(:expense).permit(:month, :cost, :expense_report_id)
  end

end
