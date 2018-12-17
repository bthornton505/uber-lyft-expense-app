class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!current_user
  end

  def logged_in_required
    redirect_to root_path unless logged_in?
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # def current_expense_report
  #   @current_expense_report ||= ExpenseReport.find(@expense_report.id)
  # end
  # helper_method :current_expense_report

end
