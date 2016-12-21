json.extract! credential, :id, :scope, :user_id, :access, :created_at, :updated_at
json.url credential_url(credential, format: :json)