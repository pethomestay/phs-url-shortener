json.array!(@url_shorts) do |url_short|
  json.extract! url_short, :id, :code, :end_point, :hit_count
  json.url url_short_url(url_short, format: :json)
end
