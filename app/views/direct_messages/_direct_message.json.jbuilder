json.extract! direct_message, :id, :sender_id, :recipient_id, :body, :created_at, :updated_at
json.url direct_message_url(direct_message, format: :json)
