json.array!(@users) do |user|
  json.extract! user, :id, :name, :twitter, :facebook, :linkedin
  json.url user_url(user, format: :json)
end
