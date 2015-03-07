require 'net/ftp'

=begin
result = system("wget --header 'API-AUTHENTICATION: 288c79b9556747d6a66da933720b484a:aecdb2f39e8a4499980dd98a2f083856c547129de799420fa80ed302f51608cd' 'https://lotusmarket.revelup.com/resources/Inventory/?format=json&limit=500000000000' -O 'scripts/jsonoutput/RevInventory.json'")
if result.nil?
  puts "Error was #{$?}"
elsif result
  puts "Grabbed the JSON from Revel!"
=end
  

########## BEGIN FTP TRANSFER #########

ftp = Net::FTP.new
ftp.connect("lotusdelivery.com",21)
ftp.login("jalsamn","t9zVhn~ckCz4")
ftp.chdir("/public_html")
ftp.passive = true

file = "RevInventory.json"

ftp.getbinaryfile(file, 'scripts/jsonoutput/RevInventory.json')
ftp.close
  
json = File.new('scripts/jsonoutput/RevInventory.json', 'r')
parser = Yajl::Parser.new
hash = parser.parse(json)


  hash["objects"].each do |prod|
  begin
    if !Rinventor.exists?(:rproductid => prod["id"])
      next if prod["establishment"] == "/enterprise/Establishment/2/"
        revinv = Rinventor.new
        revinv.rproductid = prod["id"]
        revinv.update_date = prod["update_date"]
        revinv.starting_amount = prod["starting_amount"]
        revinv.added_amount = prod["added_amount"]
        revinv.threshold = prod["threshold"]
        revinv.sold_amount = prod["sold_amount"]
        revinv.actual_amount = prod["actual_amount"]
        revinv.theoretical_ending_inventory = prod["theoretical_ending_inventory"]
        revinv.save
        puts "Added Inventory for product with id "
        puts prod["id"]
    else
     
        next if prod["establishment"] == "/enterprise/Establishment/2/"
      
          revinv = Rinventor.find_by rproductid: prod["id"]
          revinv.rproductid = prod["id"]
          revinv.update_date = prod["update_date"]
          revinv.starting_amount = prod["starting_amount"]
          revinv.added_amount = prod["added_amount"]
          revinv.threshold = prod["threshold"]
          revinv.sold_amount = prod["sold_amount"]
          revinv.actual_amount = prod["actual_amount"]
          revinv.theoretical_ending_inventory = prod["theoretical_ending_inventory"]
          revinv.save 
          puts "Updated product with id "
          puts prod["id"] 
    end  
  rescue 
    puts "Error was #{$?}"
  end
  end

