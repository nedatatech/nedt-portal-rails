class Employee < ApplicationRecord
  has_secure_password
  belongs_to :invoices, optional: true
  belongs_to :payments, optional: true
  before_save :encrypt_password
  after_save :clear_password
  has_many :payments, as: :pay_to
  has_many :payments, as: :pay_from

def encrypt_password
  #if password.present?
  #  self.salt = BCrypt::Engine.generate_salt
  #  self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  #end
  if password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.password_digest= BCrypt::Engine.hash_secret(password, salt)
  end
end

def clear_password
  self.password = nil
end

end
