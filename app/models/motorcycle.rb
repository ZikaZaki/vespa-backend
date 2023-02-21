class Motorcycle < ApplicationRecord
  has_one_attached :image
  has_many :reservations
  has_many :users, through: :reservations
  has_many :cities, through: :reservations

  validates_presence_of :model_no
  validates_uniqueness_of :model_no
  validates_presence_of :model_name
  validates_presence_of :finance_fee
  validates_presence_of :purchase_fee
  validates_presence_of :production_date

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(image) if image.attached?
  end
end
