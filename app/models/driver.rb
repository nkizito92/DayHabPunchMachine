class Driver < ActiveRecord::Base
    has_many :clients
    belongs_to :user
end
