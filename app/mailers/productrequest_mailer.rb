class ProductrequestMailer < ActionMailer::Base
  default from: "info@lotusaz.com"
  
  def productrequest_email(request)
    @request = request
    mail :subject => "New Lotus Market Product Request for " + @request.name ,
         :to      => "gpatel@janakfoods.com",
         :from    => "jalsamn@gmail.com"
  end
end
