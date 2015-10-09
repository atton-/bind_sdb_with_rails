json.array!(@records) do |record|
  json.extract! record, :id, :ip, :domain
  json.url record_url(record, format: :json)
end
