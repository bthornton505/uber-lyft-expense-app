class ExpensesController < ApplicationController

  def show
    @expense = Expense.find_by(id: params[:id])
  end

  def new
    @expense_report = ExpenseReport.find(params[:expense_report_id])
    @expense = Expense.new(:expense_report => @expense_report)
    @category = Category.find_by(params[:id])
    @categories = Category.all
    @expense.comments.build( expense_id: @expense.id, category_id: @category.id )

  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      flash[:message] = "Successfully created new expense"
      redirect_to expense_path(@expense)
    else
      render :new
    end

  end


  private

  def expense_params
    params.require(:expense).permit(:month, :cost, :expense_report_id, :comments_attributes => [:description, :expense_id, :category_id])
  end

end
