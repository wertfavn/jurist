class MessageMailer < ApplicationMailer
  
  default from: "krmuofficial@gmail.com"
  default to: "completelydifferentuser@gmail.com"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end
  
end

