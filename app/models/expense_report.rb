class ExpenseReport < ActiveRecord::Base
  has_many :expenses
  belongs_to :user

  validates :month, presence: true
  validates :year, presence: true
  validates :user_id, presence: true

  scope :recently_added, -> { order(created_at: :desc) }
  scope :by_year, -> { order(year: :desc)}

  def self.current_expense_report
    self.recently_added.first
  end

end
