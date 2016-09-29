json.array!(@users) do |user|
  json.extract! user, :id, :user_id, :email, :session_token
  json.url user_url(user, format: :json)
end
