class Image < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :client, optional: true
  has_one_attached :image_element
end
