class Employee < ApplicationRecord
  has_secure_password
  before_save :encrypt_password
  after_save :clear_password
  has_many :email_addrs
  accepts_nested_attributes_for :email_addrs

def encrypt_password
  if password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.password_digest= BCrypt::Engine.hash_secret(password, salt)
  end
end

def clear_password
  self.password = nil
end

end
