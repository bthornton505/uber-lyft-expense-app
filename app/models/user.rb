class User < ActiveRecord::Base
  has_secure_password

  has_many :expense_reports
  has_many :expenses, through: :expense_reports

end
