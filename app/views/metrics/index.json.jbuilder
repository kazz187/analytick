json.array!(@metrics) do |metric|
  json.extract! metric, :id, :chart_id, :time, :value
  json.url metric_url(metric, format: :json)
end
