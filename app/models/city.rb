class City < ApplicationRecord
  has_one_attached :image

  validates_presence_of :name
  validates_uniqueness_of :name

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(image) if image.attached?
  end
end
