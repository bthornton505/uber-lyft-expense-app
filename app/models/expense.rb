class Expense < ActiveRecord::Base
  belongs_to :expense_report
  has_many :comments
  has_many :categories, through: :comments

  validates :month, presence: true
  validates :cost, presence: true
  validates :expense_report_id, presence: true

  def comments_attributes=(comments_attributes)
    self.comments.destroy_all
    comments_attributes.each do |i, comment_attributes|
      self.comments.build(comment_attributes)
    end
  end

end
