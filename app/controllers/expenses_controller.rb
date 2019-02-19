class ExpensesController < ApplicationController
  before_action :login_required, :set_report
  before_action :set_expense, only: [:show, :edit, :update, :delete]
  before_action :set_categories, only: [:new, :create, :edit, :update]

  def show
    @comment = @expense.comments.build
    @comments = @expense.comments.all
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @expense, status: 201 }
    end
  end

  def new
    @expense = Expense.new(:expense_report => @expense_report)
    @expense.comments.build( expense_id: @expense.id )
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      flash[:success] = "Successfully created new expense"
      redirect_to expense_report_expense_path(@expense_report.id, @expense)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      flash[:success] = "Successfully updated expense"
      redirect_to expense_report_expense_path(@expense_report.id, @expense)
    else
      flash[:alert] = "Something went wrong updating this expense. Try again."
      @category = Category.find_by(params[:id])
      render :edit
    end
  end

  def destroy
    if @expense.destroy
      flash[:success] = "Successfully deleted expense"
      redirect_to expense_report_path(@expense_report)
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:month, :cost, :expense_report_id, :category_id, :comments_attributes => [:description, :expense_id])
  end

  def set_report
    @expense_report = ExpenseReport.find_by(id: params[:expense_report_id])
  end

  def set_expense
    @expense = Expense.find_by(id: params[:id])
  end

  def set_categories
    @categories = Category.all
  end

end
