json.extract! reservation, :id, :reserve_date, :returning_date, :user_id, :motorcycle_id, :city_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
