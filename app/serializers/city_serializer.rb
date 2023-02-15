class CitySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :image, :image_url, :created_at, :updated_at
end
