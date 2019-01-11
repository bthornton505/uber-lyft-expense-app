class ExpenseReport < ActiveRecord::Base
  has_many :expenses
  belongs_to :user

  validates :month, presence: true
  validates :year, presence: true
  validates :user_id, presence: true

  scope :order_by_year, -> { order(year: :desc) }
  scope :by_year, -> (year) { select(:id, :month, :year).where("year = ?", year) }

  # def self.current_expense_report
  #   self.recently_added.first
  # end

end
