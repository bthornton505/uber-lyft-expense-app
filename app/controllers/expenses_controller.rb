class ExpensesController < ApplicationController
  before_action :logged_in_required

  def show
    @expense_report = ExpenseReport.find_by(params[:id])
    @expense = Expense.find_by(id: params[:id])
  end

  def new
    @expense_report = ExpenseReport.find_by(params[:id])
    @expense = Expense.new(:expense_report => @expense_report)

    # binding.pry

    # @expense_report = ExpenseReport.find_by(params[:expense_report_id])
    # @expense = Expense.new(:expense_report => @expense_report)
    # binding.pry
    @category = Category.find_by(params[:id])
    @categories = Category.all
    @expense.comments.build( expense_id: @expense.id, category_id: @category )
  end

  def create
    @expense = Expense.new(expense_params)
    # binding.pry
    if @expense.save
      flash[:message] = "Successfully created new expense"
      redirect_to expense_path(@expense)
    else
      render :new
    end
  end

  def edit
    @expense_report = ExpenseReport.find_by(params[:id])
    @expense = Expense.find_by(params[:id])
    @category = Category.find_by(params[:id])
    @categories = Category.all

  end

  def update

  end

  private

  def expense_params
    params.require(:expense).permit(:month, :cost, :expense_report_id, :comments_attributes => [:description, :expense_id, :category_id])
  end

end
