class User < ApplicationRecord
  validates_presence_of :email, :password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
end
