class Expense < ActiveRecord::Base
  belongs_to :expense_report
  has_many :comments
  has_many :categories, through: :comments

  # accepts_nested_attributes_for :comments

  def comments_attributes=(comments_attributes)
    raise comments_attributes.inspect
    comments_attributes.each do |i, comment_attributes|
      self.comments.build(comment_attributes)
    end
  end


  def category=(category_id)
    self.category = Category.find_by(id: category_id)
  end

end
