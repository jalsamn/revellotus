time1    = Date.yesterday
time2 = Time.now

@itemsperday = Groupedtotal
    .select("name, SUM(totalsold) as totalsold")
    .where(created_date: time1..time2) 
    .group("name")
    .sort_by(&:totalsold).reverse

@itemsperday.first(50).each do |item|  
  puts item.name
end

ReportingMailer.daily_top_seller_email(@itemsperday).deliver