class User < ActiveRecord::Base
  has_secure_password

  has_many :expense_reports
  has_many :expenses, through: :expense_reports

  def self.find_or_create_by_omniauth(auth_hash)
        self.where(:name => auth_hash["info"]["name"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

end
