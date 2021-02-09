class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { is: 3 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials email, password
  end
end
