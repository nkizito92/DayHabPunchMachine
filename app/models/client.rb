class Client < ActiveRecord::Base
    has_one_attached :client_photo
    has_many :punches
    belongs_to :driver
end
