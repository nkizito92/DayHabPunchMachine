class ImageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :image_element, :user_id, :user, :client_id, :client

  def image_element
    if object.image_element.attached?
      { 
        url: rails_blob_url(object.image_element)
      }
    end
  end
end
