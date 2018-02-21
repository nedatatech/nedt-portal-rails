class Employee < ApplicationRecord
  has_secure_password
  belongs_to :invoices, optional: true
  has_many :payments, as: :pay_to
  has_many :payments, as: :pay_from
  #belongs_to :commentable, polymorphic: true
  before_save :encrypt_password
  after_save :clear_password

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

private 

def fullname
    "#{first_name} #{last_name}"
end

end
