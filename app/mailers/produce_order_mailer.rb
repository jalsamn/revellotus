class ProduceOrderMailer < ActionMailer::Base
  default from: "info@lotusaz.com"
  
  def produce_order_email(items)
     @items = items
    mail to: "jalsamn@gmail.com", subject: "Produce Order for " + @items.vendor + " , Date: " + Date.today.to_time.strftime('%B %e') 

  end
  
  def send_simple_message
  RestClient.post "https://api:key-81696eb8ef4d7ffc862c6158a33598e2"\
  "@api.mailgun.net/v2/sandbox991a7c03225a4cbb9f3a0f0310b71bb9.mailgun.org/messages",
  :from => "Mailgun Sandbox <postmaster@sandbox991a7c03225a4cbb9f3a0f0310b71bb9.mailgun.org>",
  :to => "Gunjan <jalsamn@gmail.com>",
  :subject => "Hello Gunjan",
  :text => "Congratulations Gunjan, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
end
end
