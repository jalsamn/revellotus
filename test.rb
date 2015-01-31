puts "Grabbed the JSON from Revel!"
json = File.new('RevProducts.json', 'r')
parser = Yajl::Parser.new
hash = parser.parse(json)


 hash["objects"].last do |prod|
  puts  prod["name"]
  puts  prod["id"]
 end