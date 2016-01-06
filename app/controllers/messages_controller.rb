class MessagesController < ApplicationController
   def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      redirect_to contact_path, notice: "Ваше повiдомлення було вiдправлене!"
    else
      flash[:alert] = "Сталась помилка пiд час вiдправлення повiдомлення!"
      render :new
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
