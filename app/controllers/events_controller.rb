class EventsController < ApplicationController
  def index  
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def title
    @message = Message.new
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
    render 'join_us'
  end
  
end
