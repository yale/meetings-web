class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  has_secure_token :api_key

  def filled_out_profile?
    company_name.present?
  end

  def admin?
    role == 'admin'
  end
end
