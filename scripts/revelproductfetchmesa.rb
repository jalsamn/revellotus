require 'net/ftp'

result = system("wget --header 'API-AUTHENTICATION: 288c79b9556747d6a66da933720b484a:aecdb2f39e8a4499980dd98a2f083856c547129de799420fa80ed302f51608cd' 'https://lotusmarket.revelup.com/resources/Product/?format=json&establishment=1&limit=5000000000000000' -O 'RevProducts.json'")
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
    if !Product.exists?(:barcode => prod["barcode"])
      next if prod["establishment"] == "/enterprise/Establishment/2/"
        product = Product.new
        product.name = prod["name"]
        product.sku = prod["sku"]
        product.barcode = prod["barcode"]
        product.category = prod["category"]
        product.rewardpoint = prod["point_value"]
        product.cost = prod["cost"]
        product.active = prod["active"]
        product.price = prod["price"]
        product.revid = prod["id"]
        product.location = prod["establishment"]
        product.save
        puts "Added product with id "
        puts prod["id"]
    else
     
        next if prod["establishment"] == "/enterprise/Establishment/2/"
      
          product = Product.find_by(barcode: prod["barcode"])
          product.name = prod["name"]
          product.sku = prod["sku"]
          product.barcode = prod["barcode"]
          product.category = prod["category"]
          product.rewardpoint = prod["point_value"]
          product.cost = prod["cost"]
          product.active = prod["active"]
          product.price = prod["price"]
          product.revid = prod["id"]
          product.location = prod["establishment"]
          product.save
          puts "Updated product with id "
          puts prod["id"] 
    end  
   rescue 
    puts "Error was #{$?}"
  end
  end

Product.where('barcode IS NUll').delete_all
