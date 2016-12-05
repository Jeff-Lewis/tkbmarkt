json.extract! appointment_document, :id, :name, :created_at, :updated_at
json.url appointment_document_url(appointment_document, format: :json)