class ExpenseReportsController < ApplicationController

  def show
    @expense_report = ExpenseReport.find_by(id: params[:id])
  end

  def index
    if params[:user_id] && current_user.id == params[:user_id].to_i
      @user = current_user
      @expense_reports = @user.expense_reports
    elsif params[:user_id]
      redirect_to expense_report_path
    else
      @expense_reports = ExpenseReport.all
    end
  end

  def new
    if params[:user_id] && current_user.id == params[:user_id].to_i
      @user = current_user
      @expense_report = ExpenseReport.new(user_id: params[:user_id])
    else
      redirect_to expense_reports_path
    end
  end

  def create
    @expense_report = ExpenseReport.create(expense_report_params)
    # binding.pry
    if @expense_report.valid?
      flash[:message] = "Successfully created new expense report!"
      redirect_to expense_report_path(@expense_report)
    else
      render :new
    end

  end


  private

  def expense_report_params
    params.require(:expense_report).permit(:month, :year, :user_id)
  end
end
