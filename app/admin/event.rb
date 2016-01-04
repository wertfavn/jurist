ActiveAdmin.register Event do
  
  permit_params :name, :description, :slug, :title_image, :regular_images => []
  
  actions :all
  
  index do
    column :name
    column :description
    column :created_at
    actions
  end
  
  controller do
    
    def show
      @page = Event.find(params[:id])
      #@page.authors = @page.admin_users.map {|admin| admin.name }
    end
    
    def edit
      @page = Event.find(params[:id])
    end
    
    def update
      @page = Event.find(params[:id])
      super
    end
    
    def destroy
      @page = Event.find(params[:id])
      super
    end
    
    private
    def page_params
      params.require(:page).permit(:name, :description, :slug, :title_image, :regular_images => [])
    end
  end
  
  form :html => { :multipart => true } do |f|
   f.inputs "Событие" do
     f.input :name, :label => "Название события"
     f.input :description, :label => "Описание"
     f.input :title_image, :as => :formtastic_attachinary
     f.input :regular_images, :as => :formtastic_attachinary 
   end
   f.actions
 end
  
  
  
end
