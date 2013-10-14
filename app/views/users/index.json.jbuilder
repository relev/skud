json.array!(@users) do |user|
  json.extract! user, :id, :lock, :email, :password, :first_name, :last_name, :gender
  json.url user_url(user, format: :json)
end
