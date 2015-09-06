time1    = "2015-08-24"
time2 = "2015-08-30"

@itemsrevenueperday = Groupedincometotal
    .select("name, SUM(itemrevenue) as totalsold")
    .where(created_date: time1..time2) 
    .where(:category => ['/products/ProductCategory/539/', '/products/ProductCategory/120/'] )
    .group("name")
    .sort_by(&:totalsold).reverse

totalrevenue = 0

@itemsrevenueperday.each do |item|
  # do whatever
  puts item.name + " " + item.totalsold.to_s
  totalrevenue = totalrevenue + item.totalsold
end

puts "Total Produce Revenue " + totalrevenue.to_s