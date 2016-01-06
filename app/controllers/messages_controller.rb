class MessagesController < ApplicationController
   def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid? &&  verify_recaptcha(:model => @message, :message => "Будь ласка введiть текст з зображення!")
        MessageMailer.new_message(@message).deliver
        redirect_to contact_path, notice: "Ваша анкета була вiдправлена!"
    else
      redirect_to contact_path, notice: "Сталась помилка пiд час вiдправлення анкети. Перевiрте, будь ласка, iнформацiю!"
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :content, :phone, :why, :year_birth, :studywork, :captcha, :captcha_key)
  end
end
