class EventsController < ApplicationController
  def index  
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def title
    render 'title_page'
  end
  
  def about_us
    render 'about_us'
  end
  
  def contacts
    render 'contacts'
  end
  
  def team
    render 'team'
  end
  
  def join_us
    @message = Message.new
    render 'join_us'
  end
  
end
