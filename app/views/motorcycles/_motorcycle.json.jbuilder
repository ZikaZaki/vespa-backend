json.extract! motorcycle, :id, :model_no, :model_name, :finance_fee, :purchase_fee, :production_date, :description,
              :created_at, :updated_at
json.url motorcycle_url(motorcycle, format: :json)
