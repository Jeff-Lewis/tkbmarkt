json.extract! appointment, :id, :name, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)