json.array!(@databases) do |database|
  json.extract! database, :id, :db_type, :db_name
  json.url database_url(database, format: :json)
end
