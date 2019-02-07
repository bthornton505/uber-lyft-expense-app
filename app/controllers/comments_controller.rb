class CommentsController < ApplicationController
  before_action :login_required

  def new
    @expense = Expense.find_by(id: params[:expense_id])
    @comment = @expense.comments.build
    @categories = Category.all
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = "Successfully added comment."
      redirect_to expense_report_expense_path(@comment.expense.expense_report, @comment.expense)
    else
      flash[:alert] = "Something went wrong creating this comment. Try again."
      @categories = Category.all
      render :new
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:description, :expense_id, :category_id)
  end

end
