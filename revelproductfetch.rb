result = system("wget --header 'API-AUTHENTICATION: 288c79b9556747d6a66da933720b484a:aecdb2f39e8a4499980dd98a2f083856c547129de799420fa80ed302f51608cd' 'https://lotusmarket.revelup.com/resources/Product/?format=json&limit=5000000' -O 'RevProducts.json'")
if result.nil?
  puts "Error was #{$?}"
elsif result
  puts "Grabbed the JSON from Revel!"
end

json = File.new('RevProducts.json', 'r')
parser = Yajl::Parser.new
hash = parser.parse(json)


  hash["objects"].each do |prod|
  begin
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
      puts "Added product "
      puts prod["name"]
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
      puts "Updated product "
      puts prod["name"] 
    end  
   rescue
        puts "an error happened but I'm not done yet."
  end
  end

