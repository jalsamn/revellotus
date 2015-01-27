json.array!(@products) do |product|
  json.extract! product, :id, :name, :sku, :barcode, :category, :subcategory, :rewardpoint, :cost, :active
  json.url product_url(product, format: :json)
end
