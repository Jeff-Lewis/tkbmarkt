json.extract! user_ticket, :id, :name, :created_at, :updated_at
json.url user_ticket_url(user_ticket, format: :json)