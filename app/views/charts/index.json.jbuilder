json.array!(@charts) do |chart|
  json.extract! chart, :id, :name, :db_id, :query, :type
  json.url chart_url(chart, format: :json)
end
