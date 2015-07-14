#ContactMailer class inherits from ActionMailer library

class ContactMailer < ActionMailer::Base
  default to: 'disa.coty@gmail.com'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
    mail(from: email, subject: 'Contact form message')     
  end
end 