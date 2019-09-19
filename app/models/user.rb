class User < ApplicationRecord
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

    validates :name, {presence: true, length:{minimum: 4}}
    validates :sex, {presence: true}
    validates :age, {presence: true}
    validates :address, {presence: true, length: {minimum: 2}}
    validates :password_digest, {presence: true, length: {minimum: 4}}

end
