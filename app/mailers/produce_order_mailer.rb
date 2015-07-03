class ProduceOrderMailer < ActionMailer::Base
  default from: "info@lotusaz.com"
  
  def produce_order_email(items)
    @items = items
    mail :subject => "Produce Order for " + @items.vendor + ", Date: " + Date.today.to_time.strftime('%B %e'),
         :to      => "jalsamn@gmail.com",
         :from    => "jalsamn@gmail.com"
  end
  
  def orderitems_finished()
      mail :subject => "OrderItem Import script completed: " + Date.today.to_time.strftime('%B %e'),
         :to      => "jalsamn@gmail.com",
         :from    => "jalsamn@gmail.com"
  end

end
