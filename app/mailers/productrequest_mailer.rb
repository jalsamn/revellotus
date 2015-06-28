class ProductrequestMailer < ActionMailer::Base
  default from: "info@lotusaz.com"
  
  def productrequest_email(request)
    @request = request
    mail :subject => "New Lotus Market Product Request for " + @request.name ,
         :to      => "gpatel@janakfoods.com",
         :from    => "lotusmarket@lotusaz.com"
  end
  
  def productrequest_inprogress_email(request)
    @request = request
    mail :subject => "Your Lotus Market Product Request for " + @request.name ,
         :to      => @request.email,
         :from    => "lotusmarket@lotusaz.com"
  end
  
  def productrequest_fullfilled_email(request)
      @request = request
      mail :subject => "Your Lotus Market Product Request for " + @request.name ,
           :to      => @request.email,
           :from    => "lotusmarket@lotusaz.com"
  end
  
  def productrequest_notfullfilled_email(request)
      @request = request
      mail :subject => "Your Lotus Market Product Request for " + @request.name ,
           :to      => @request.email,
           :from    => "lotusmarket@lotusaz.com"
  end
  
end
