json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title
  json.url idea_url(idea, format: :json)
end
