class ContactUsMailer < ActionMailer::Base

  default :to => "sam@samwalton.me"

  def send(message)
    @message = message
    mail( :subject => @message.subject, :from => @message.email ) do |format|
      format.text
    end
  end
end