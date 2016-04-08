json.array!(@textos) do |texto|
  json.extract! texto, :id, :description, :image, :second_image
  json.url texto_url(texto, format: :json)
end
