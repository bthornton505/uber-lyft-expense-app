class ExpenseReport < ActiveRecord::Base
  has_many :expenses
  belongs_to :user

  validates :month, :year, :user_id, presence: true
  # validates :year, presence: true
  # validates :user_id, presence: true

  # Bottom line was original idea but found better solution to orginizing expense reports
  # scope :by_chronological_order, -> { order(year: :desc)}
  scope :recently_added, -> { order(created_at: :desc) }
  # scope :current_report, -> { (created_at: :desc) }
  scope :by_year, -> { order(year: :desc)}

  def self.current_expense_report
    self.recently_added.first
  end

end
