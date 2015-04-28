@itemsperday = Groupedtotal
          .select("name, SUM(totalsold) as totalsold, rinventors.theoretical_ending_inventory as inventoryonhand")
          .where('created_date > ?', (Date.today - 60))
          .having('SUM(totalsold) < 9')
          .joins('LEFT OUTER JOIN rinventors ON rinventors.rproductid = productid')
          .group("name, rinventors.theoretical_ending_inventory")
          .having('rinventors.theoretical_ending_inventory > 25')
          .sort_by(&:inventoryonhand).reverse

@itemsperday.each do |item|
  puts item.name + " Sold: " + item.totalsold.to_s + " InStock: " + item.inventoryonhand.to_s
end
