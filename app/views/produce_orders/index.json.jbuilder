json.array!(@produce_orders) do |produce_order|
  json.extract! produce_order, :id, :vendor, :orderdate
  json.url produce_order_url(produce_order, format: :json)
end
