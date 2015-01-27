json.array!(@templabels) do |templabel|
  json.extract! templabel, :id, :barcode
  json.url templabel_url(templabel, format: :json)
end
