class MessageMailer < ApplicationMailer
  
  default from: "krmuofficial@gmail.com"
  default to: "evgeniy.zhukovskiy.big@gmail.com"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end
  
end

