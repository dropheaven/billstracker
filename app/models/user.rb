class User < ActiveRecord::Base
  has_many :bills
  has_secure_password
  validates :full_name, :email, :password_digest, presence: true
end
