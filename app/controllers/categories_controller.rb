class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.valid?
      @category.save
    else
      flash[:message] = "Not a valid category"
      redirect_to new_expense_report_expense_path(@user.expense_reports)
    end 

  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

end
