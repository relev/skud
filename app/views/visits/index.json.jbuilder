json.array!(@visits) do |visit|
  json.extract! visit, :id, :lock, :device_id, :session_key, :user_id, :closed_at
  json.user visit.user
end
