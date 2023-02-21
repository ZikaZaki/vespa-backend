class City < ApplicationRecord
  has_one_attached :image
  has_many :reservations
  has_many :users, through: :reservations
  has_many :motorcycles, through: :reservations

  validates_presence_of :name
  validates_uniqueness_of :name

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(image) if image.attached?
  end
end
