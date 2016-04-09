json.array!(@ifttt_callbacks) do |ifttt_callback|
  json.extract! ifttt_callback, :id, :create
  json.url ifttt_callback_url(ifttt_callback, format: :json)
end
