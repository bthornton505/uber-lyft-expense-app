class ExpensesController < ApplicationController
  before_action :login_required

  def show
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.find_by(id: params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @expense, status: 201 }
    end
  end

  def new
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.new(:expense_report => @expense_report)
    @categories = Category.all
    @expense.comments.build( expense_id: @expense.id )
  end

  def create
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.new(expense_params)

    if @expense.save
      flash[:success] = "Successfully created new expense"
      redirect_to expense_report_expense_path(@expense_report.id, @expense)
    else
      # @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
      @categories = Category.all
      render :new
    end
  end

  def edit
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.find_by(id: params[:id])
    @categories = Category.all
    # binding.pry
  end

  def update
    # binding.pry
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.find_by(id: params[:id])

    if @expense.update(expense_params)
      flash[:success] = "Successfully updated expense"
      redirect_to expense_report_expense_path(@expense_report.id, @expense)
    else
      flash[:alert] = "Something went wrong updating this expense. Try again."
      @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
      @expense = Expense.find_by(id: params[:id])
      @category = Category.find_by(params[:id])
      @categories = Category.all
      render :edit
    end

  end

  def destroy
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
    @expense = Expense.find_by(id: params[:id])

    if @expense.destroy
      flash[:success] = "Successfully deleted expense"
      redirect_to expense_report_path(@expense_report)
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:month, :cost, :expense_report_id, :category_id, :comments_attributes => [:description, :expense_id])
  end

end
