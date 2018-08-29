class ContactMailer < ActionMailer::Base
  default :from => "testtesting058@gmail.com"
 
  def welcome_email(contact)
   @contact = contact
    mail(:to => contact.email_field, :subject => "Contact US")
  end
end