time1    = Date.yesterday
time2 = Time.now

@itemsrevenueperday = Groupedincometotal
    .select("name, SUM(itemrevenue) as totalsold")
.where(created_date: time1..time2) 
    .group("name")
    .sort_by(&:totalsold).reverse

@itemsperday = Groupedtotal
    .select("name, SUM(totalsold) as totalsold")
    .where(created_date: time1..time2) 
    .group("name")
    .sort_by(&:totalsold).reverse


ReportingMailer.daily_top_seller_email(@itemsrevenueperday, @itemsperday).deliver