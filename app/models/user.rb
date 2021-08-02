# app/models/user.rb
class User < ApplicationRecord
    # encrypt password
    has_secure_password
    # Model associations
    has_many :measurements
    # Validations
    validates_presence_of :name, :password_digest
    validates_uniqueness_of :name
end