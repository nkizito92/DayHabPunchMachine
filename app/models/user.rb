class User < ActiveRecord::Base
    has_secure_password
    has_many :drivers
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
end
