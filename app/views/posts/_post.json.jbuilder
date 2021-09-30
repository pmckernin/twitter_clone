json.extract! post, :id, :user_id, :body, :reply_to_id, :repost_of_id, :created_at, :updated_at
json.url post_url(post, format: :json)
