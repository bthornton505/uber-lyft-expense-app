class Expense < ActiveRecord::Base
  belongs_to :expense_report
  has_many :comments
  has_many :categories, through: :comments

  validates :month, presence: true
  validates :cost, presence: true 


  def comments_attributes=(comments_attributes)
    comments_attributes.each do |i, comment_attributes|
      self.comments.build(comment_attributes)
    end
  end

end
