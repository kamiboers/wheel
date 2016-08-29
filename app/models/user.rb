class User < ApplicationRecord
  has_secure_password

  validates :username,  presence: true, 
                        uniqueness: true, 
                        length: { in: 6..16 },
                        on: :create
  validates :email,     presence: true, 
                        uniqueness: true, 
                        format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, 
                        on: :create
  validates :password,  presence: true, 
                        confirmation: true, 
                        length: { in: 8..20 },
                        on: :create

end
