class Expense < ActiveRecord::Base
  belongs_to :expense_report
  has_many :comments
  # The below relationship needs to be a has_one relationship
  # It will no longer be through the comments join table
  belongs_to :category

  validates :month, presence: true
  validates :cost, presence: true
  validates :expense_report_id, presence: true

  def comments_attributes=(comments_attributes)
    self.comments.destroy_all
    comments_attributes.each do |i, comment_attributes|
      self.comments.build(comment_attributes)
    end
  end

  def self.category=(category)
    write_attribute(:category, self.category.name)
  end

end
