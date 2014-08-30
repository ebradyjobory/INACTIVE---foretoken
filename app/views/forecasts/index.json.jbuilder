json.array!(@forecasts) do |forecast|
  json.extract! forecast, :id, :year, :revenue
  json.url forecast_url(forecast, format: :json)
end
