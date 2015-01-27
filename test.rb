require 'json'
obj = JSON.parse(IO.read("Productsmall.json"))
obj["objects"].each do |prod|
  
  if !Product.exists?(:sku => prod["sku"])
    product = Product.new
    product.name = prod["name"]
    product.sku = prod["sku"]
    product.barcode = prod["barcode"]
    product.category = prod["category"]
    product.rewardpoint = prod["point_value"]
    product.cost = prod["cost"]
    product.active = prod["active"]
    product.price = prod["price"]
    product.save
  else
    product = Product.find_by sku: prod["sku"]
    product.name = prod["name"]
    product.sku = prod["sku"]
    product.barcode = prod["barcode"]
    product.category = prod["category"]
    product.rewardpoint = prod["point_value"]
    product.cost = prod["cost"]
    product.active = prod["active"]
    product.price = prod["price"]
    product.save
  end  
  
  
end

=begin

if Product.exists?(:sku => prod["sku"]) == "false"
  product = Product.first
  puts product.name
  end

  if Product.exists?(:sku => prod["sku"]) == "false"
    product = Product.new
    product.name = prod["name"]
    product.sku = prod["sku"]
    product.barcode = prod["barcode"]
    product.category = prod["category"]
    product.pointvalue = prod["point_value"]
    product.cost = prod["cost"]
    product.active = prod["active"]
    product.save
  else
    product = Product.find_by sku: prod["sku"]
    product.name = prod["name"]
    product.sku = prod["sku"]
    product.barcode = prod["barcode"]
    product.category = prod["category"]
    product.pointvalue = prod["point_value"]
    product.cost = prod["cost"]
    product.active = prod["active"]
    product.save
  end  
=end
