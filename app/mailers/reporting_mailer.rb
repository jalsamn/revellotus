class ReportingMailer < ActionMailer::Base

  default from: "info@lotusaz.com"
  
  def daily_top_seller_email(revenueitems, salesitems)
    @revenueitems = revenueitems
    @salesitems = salesitems
    mail :subject => "Top Seller Report for both locations, Date: " +   Date.yesterday.to_time.strftime('%B %e'),
    :to      => "mclemenson@janakfoods.com, kapilvijh@gmail.com, gpatel@janakfoods.com",
    :from    => "gpatel@lotusaz.com"
  end  
  
  def custom_produce_sales_email(start_date, end_date, email)
    @itemsperdaymesa = Groupedtotal
    .select("name, SUM(totalsold) as totalsold, category")
    .where(created_date: start_date..end_date) 
    .where(category: '/products/ProductCategory/120/')
      .group("name, category")
      .sort_by(&:totalsold).reverse
    
    @itemsperdayphx = Groupedtotal
    .select("name, SUM(totalsold) as totalsold, category")
    .where(created_date: start_date..end_date) 
    .where(category: '/products/ProductCategory/539/')
      .group("name, category")
      .sort_by(&:totalsold).reverse
    mail :subject => "Produce Sales for Mesa, Date: " +   start_date.to_time.strftime('%B %e') + " to " + end_date.to_time.strftime('%B %e'),
    :to      => email,
    :from    => "gpatel@lotusaz.com"
  end  
  
end
