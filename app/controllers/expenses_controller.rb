class ExpensesController < ApplicationController
  before_action :logged_in_required

  def show
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.find_by(id: params[:id])
  end

  def new
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.new(:expense_report => @expense_report)
    @category = Category.find_by(params[:id])
    @categories = Category.all
    @expense.comments.build( expense_id: @expense.id, category_id: @category )
  end

  def create
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.new(expense_params)

    if @expense.save
      flash[:message] = "Successfully created new expense"
      redirect_to expense_report_expense_path(@expense_report.id, @expense)
    else
      render :new
    end
  end

  def edit
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.find_by(id: params[:id])
    @category = Category.find_by(params[:id])
    @categories = Category.all

  end

  def update
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.find_by(id: params[:id])

    if @expense.update(expense_params)
      redirect_to expense_report_expense_path(@expense_report.id, @expense)
    else
      render :edit
    end
    
  end

  private

  def expense_params
    params.require(:expense).permit(:month, :cost, :expense_report_id, :comments_attributes => [:description, :expense_id, :category_id])
  end

end
