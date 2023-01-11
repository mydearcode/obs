class User < ApplicationRecord
    require "securerandom"
    has_secure_password
    #has_secure_password :recovery_password

    validates :user_name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    
end
