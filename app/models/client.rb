class Client < ActiveRecord::Base
    has_many :punches
    belongs_to :driver
end
