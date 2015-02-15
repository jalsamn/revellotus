json.array!(@produce_order_items) do |produce_order_item|
  json.extract! produce_order_item, :id, :producename, :quantity, :order_id
  json.url produce_order_item_url(produce_order_item, format: :json)
end
