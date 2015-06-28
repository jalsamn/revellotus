class ProductrequestMailer < ActionMailer::Base
  default from: "info@lotusaz.com"
  
  def productrequest_email(request)
    @request = request
    mail :subject => "New Lotus Market Product Request for " + @request.name ,
         :to      => "gpatel@janakfoods.com",
         :from    => "info@lotusaz.com"
  end
  
  def productrequest_inprogress_email(request)
    @request = request
    mail :subject => "Your Lotus Market Product Request for " + @request.name ,
         :to      => @request.email,
         :from    => "info@lotusaz.com"
  end
end
