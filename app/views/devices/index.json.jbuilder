json.array!(@devices) do |device|
  json.extract! device, :device_type_id, :name, :user_id, :session_key, :device_key
  json.url device_url(device, format: :json)
end
