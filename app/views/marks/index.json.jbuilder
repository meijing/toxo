json.array!(@marks) do |mark|
  json.extract! mark, :id, :name, :url
  json.url mark_url(mark, format: :json)
end
