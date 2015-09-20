@date1 = 999.days.ago 
@date2 = Date.today

@psale = Groupedtotal
                .select("name, SUM(totalsold) as totalsold, productid")
                .where(created_date: @date1..@date2)
                .where(productid: '6384')
                .group("name, productid")

puts @psale.first.totalsold
