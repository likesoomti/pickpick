json.extract! reservation, :id, :people, :time, :place, :durationTime, :user_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
