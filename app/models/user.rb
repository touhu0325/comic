class User < ApplicationRecord
    validates :name,:email,:password,presence: true,uniqueness: true,length: { maximum: 100 }
    has_secure_password
end
