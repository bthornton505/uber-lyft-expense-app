class ExpenseReportsController < ApplicationController
  before_action :login_required, :set_user
  before_action :set_expense_report, only: [:show, :edit, :update, :destroy]

  def by_year
    if params[:year] == ""
      redirect_to user_expense_reports_path(current_user)
    else
      year = params[:year]
      @reports = @user.expense_reports
      @expense_reports = @user.expense_reports.by_year(year)

      respond_to do |format|
        format.html { render :index }
        format.json { render json: @expense_reports, status: 201 }
      end
    end
  end

  def show
    @expenses = Expense.all.select {|e| e.expense_report_id == @expense_report.id}
    @categories = Expense.includes(:category).map {|e| e.category if e.expense_report_id == @expense_report.id }

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @expense_report, status: 201 }
    end
  end

  def index
    @expense_reports = @user.expense_reports
    @reports = @user.expense_reports

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @reports }
    end
  end

  def new
    @expense_report = ExpenseReport.new(user_id: params[:user_id])
  end

  def create
    @expense_report = ExpenseReport.new(expense_report_params)

    if @expense_report.save
      flash[:success] = "Successfully created new expense report"
      redirect_to expense_report_path(@expense_report)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @expense_report.update(expense_report_params)
      flash[:success] = "Successfully updated expense report"
      redirect_to expense_report_path(@expense_report)
    else
      flash[:alert] = "Something went wrong updating this report. Try again."
      @expense_report = ExpenseReport.find_by(id: params[:id])
      render :edit
    end
  end

  def destroy
    @expense_report.destroy
    flash[:success] = "Successfully deleted expense report"
    redirect_to user_expense_reports_path(current_user.expense_reports)
  end

  private

  def expense_report_params
    params.require(:expense_report).permit(:month, :year, :user_id)
  end

  def set_expense_report
    @expense_report = ExpenseReport.find_by(id: params[:id])
  end

  def set_user
    @user = current_user
  end

end
