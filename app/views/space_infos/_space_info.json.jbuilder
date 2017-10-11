json.extract! space_info, :id, :name, :address, :price_per_hour, :ot, :ct, :tel, :photo, :parking, :smoking, :projector, :wifi, :printer, :consent, :payment, :place, :created_at, :updated_at
json.url space_info_url(space_info, format: :json)
