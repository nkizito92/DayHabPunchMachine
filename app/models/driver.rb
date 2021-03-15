class Driver < ActiveRecord::Base
    has_one_attached :driver_photo
    has_many :clients
    belongs_to :user
end
