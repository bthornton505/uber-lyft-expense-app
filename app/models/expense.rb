class Expense < ActiveRecord::Base
  belongs_to :expense_report
  has_many :comments
  has_many :categories, through: :comments


  def comments_attributes=(comments_attributes)
    # raise comments_attributes.inspect
    comments_attributes.each do |i, comment_attributes|
      self.comments.build(comment_attributes)
    end
  end

end
