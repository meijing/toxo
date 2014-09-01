json.array!(@image_homes) do |image_home|
  json.extract! image_home, :id
  json.url image_home_url(image_home, format: :json)
end
