
=begin
result = system("wget --header 'API-AUTHENTICATION: 288c79b9556747d6a66da933720b484a:aecdb2f39e8a4499980dd98a2f083856c547129de799420fa80ed302f51608cd' 'https://lotusmarket.revelup.com/resources/OrderItem/?format=json&limit=5000000000&updated_date__gte=2014-11-19&updated_date__lt=2014-11-23' -O 'scripts/RevOrderItems.json' --timeout=6000")
if result.nil?
  puts "Error was #{$?}"
elsif result
  puts "Grabbed the JSON from Revel!"
=end


$objArray = []
json = File.new('scripts/RevOrderItems.json', 'r')
parser = Yajl::Parser.new
hash = parser.parse(json)


  hash["objects"].each do |oi|
    begin
      
        orderitem = Orderitem.new
        orderitem.cost = oi["cost"]
        orderitem.created_by = oi["created_by"]
        orderitem.created_date = oi["created_date"]
        orderitem.rev_id = oi["id"]
        orderitem.order_local_id = oi["order_local_id"]
        str =  oi["product"].to_s
        newstr = str.scan(/\d+/)
        newstr1 = newstr.join()
        orderitem.productid = newstr1
        orderitem.product_name_override = oi["product_name_override"]
        orderitem.initial_price = oi["initial_price"]
        orderitem.price = oi["price"]
        orderitem.pure_sales = oi["pure_sales"]
        orderitem.revquantity = oi["quantity"]
        deca = oi["price"]
        decb = oi["initial_price"]
        orderitem.actualqty = (deca.to_f / decb.to_f)
        orderitem.updated_date = oi["updated_date"]
        orderitem.save
        puts "added item "
        puts oi["product_name_override"]
        
    rescue 
        $objArray.push "Error encountered @ " + oi["product_name_override"]
        #puts "Error encountered @ " + oi["product_name_override"]
    end
    
  end
ErrorMailer.sample_email($objArray).deliver

