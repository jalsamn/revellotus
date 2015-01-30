class ErrorMailer < ActionMailer::Base
  attr_reader :objArray
  default from: "jalsamn@gmail.com"
  def sample_email(objArray)
    @objArray = objArray
    mail(to: "gpatel@janakfoods.com", subject: 'Sample Email')
  end
end
