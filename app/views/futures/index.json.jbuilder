json.array!(@futures) do |future|
  json.extract! future, :id, :future_year
  json.url future_url(future, format: :json)
end
