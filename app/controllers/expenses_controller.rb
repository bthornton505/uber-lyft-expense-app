class ExpensesController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @expense = Expense.find_by(id: params[:id])
    # @expense.category = Expense.comments
  end

  def new
    @expense_report = ExpenseReport.find(params[:expense_report_id])
    @expense = Expense.new(:expense_report => @expense_report)
    @category = Category.find_by(params[:id])
    @categories = Category.all
    @expense.comments.build( expense_id: @expense.id, category_id: @category.id )

    # @category = Category.new
    # @comment = Comment.new
  end

  def create
    @expense = Expense.new(expense_params)
    # @expense_report = ExpenseReport.find(params[:expense_report_id])
    # @category = Category.find_by(params[:id])
    # @comment = Comment.new

    if @expense.save
      flash[:message] = "Successfully created new expense"
      redirect_to expense_path(@expense, @category)
    else
      render :new
    end

  end


  private

  def expense_params
    params.require(:expense).permit(:month, :cost, :expense_report_id, :comment_attributes => [:description, :expense_id, :category_id])
  end

end
