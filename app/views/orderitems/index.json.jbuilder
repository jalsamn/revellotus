json.array!(@orderitems) do |orderitem|
  json.extract! orderitem, :id, :cost, :created_by, :created_date, :rev_id, :order_local_id, :productid, :product_name_override, :initial_price, :price, :pure_sales, :revquantity, :actualqty, :updated_date
  json.url orderitem_url(orderitem, format: :json)
end
