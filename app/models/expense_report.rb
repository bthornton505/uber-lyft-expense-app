class ExpenseReport < ActiveRecord::Base
  has_many :expenses
  belongs_to :user

  validates :month, presence: true
  validates :year, presence: true
  validates :user_id, presence: true

  scope :order_by_year, -> { order(year: :desc) }
  scope :by_year, -> (year) { select(:id, :month, :year).where("year = ?", year) }

  def next(user)
    reports = user_report_ids_by_year(user)
    report_index = reports.find_index(id)
    next_report = report_index + 1

    if next_report < reports.length
      reports[next_report]
    else
      id
    end
  end

  def prev(user)
    reports = user_report_ids_by_year(user)
    report_index = reports.find_index(id)
    prev_report = report_index - 1

    if prev_report > 0
      reports[prev_report]
    else
      id
    end
  end

  private

  def user_report_ids_by_year(user)
    @related_report_ids ||= user.expense_reports.order(year: :asc).pluck(:id)
  end

end
