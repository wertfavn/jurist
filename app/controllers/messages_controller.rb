class MessagesController < ApplicationController
   def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid? 
      if verify_recaptcha(:model => @message, :message => "Будь ласка введiть текст з зображення!")
        MessageMailer.new_message(@message).deliver
        redirect_to contact_path, notice: "Ваше повiдомлення було вiдправлене!"
      end
    else
      #flash[:alert] = "Сталась помилка пiд час вiдправлення повiдомлення!"
      redirect_to contact_path, notice: "Сталась помилка пiд час вiдправлення повiдомлення!"
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :content, :captcha, :captcha_key)
  end
end
