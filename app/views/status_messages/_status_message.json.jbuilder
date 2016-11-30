json.extract! status_message, :id, :user_id, :status, :created_at, :updated_at
json.url status_message_url(status_message, format: :json)