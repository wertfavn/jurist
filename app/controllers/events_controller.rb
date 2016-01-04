class EventsController < ApplicationController
  def index
  end

  def show
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
    render 'join_us'
  end
  
end
