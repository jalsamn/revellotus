require 'json'



obj = JSON.parse(IO.read("RevProducts.json"))
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
exec ("wget --header 'API-AUTHENTICATION: 288c79b9556747d6a66da933720b484a:aecdb2f39e8a4499980dd98a2f083856c547129de799420fa80ed302f51608cd' 'https://lotusmarket.revelup.com/resources/Product/?format=json&limit=10000' -O 'RevProducts.json'")

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
