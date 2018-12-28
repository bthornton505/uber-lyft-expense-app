class ExpenseReport < ActiveRecord::Base
  has_many :expenses
  belongs_to :user

  # Bottom line was original idea but found better solution to orginizing expense reports
  # scope :by_chronological_order, -> { order(year: :desc)}
  scope :recently_added, -> { order(created_at: :desc) }

  def abc # Still working on a method to make sure the months are kept in chronoligal order. There current scope method does a pretty good job though
    self.month.sort_by { |e| e.month.downcase }
  end

end
