class ReportingMailer < ActionMailer::Base

  default from: "info@lotusaz.com"
  
  def daily_top_seller_email(items)
    @items = items
    mail :subject => "Top Seller for both location, Date: " +   Date.yesterday.to_time.strftime('%B %e'),
    :to      => "mclemenson@janakfoods.com, kapilvijh@gmail.com, gpatel@janakfoods.com",
    :from    => "gpatel@lotusaz.com"
  end  
end
