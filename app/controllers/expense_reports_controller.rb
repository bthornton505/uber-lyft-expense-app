class ExpenseReportsController < ApplicationController
  before_action :logged_in_required

  def show
    @expense_report = ExpenseReport.find_by(id: params[:id])
    @expenses = Expense.all.select {|e| e.expense_report_id == @expense_report.id}
  end

  def index # Logic still needs work. Eventually needs to be refactored.
    # if params[:user_id] && current_user.id == params[:user_id].to_i
      @user = current_user
      @expense_reports = @user.expense_reports
    # elsif params[:user_id] != current_user # I want this to redirect_to a users profile if they try to perform action on another users page
    #   redirect_to root_url                # Also show them a warning that says this action cannot be done
    # else
    #   redirect_to user_path(@user)
    # end
  end

  def new # Logic still needs work. Eventually needs to be refactored.
    # if params[:user_id] && current_user.id == params[:user_id].to_i
      @user = current_user
      @expense_report = ExpenseReport.new(user_id: params[:user_id])
    # else
    #   redirect_to root_url
    # end
  end

  def create
    @expense_report = ExpenseReport.new(expense_report_params)
    # binding.pry
    if @expense_report.save
      # binding.pry
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
