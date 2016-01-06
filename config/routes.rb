Rails.application.routes.draw do
  
  mount Attachinary::Engine => "/attachinary"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :events
  get 'contact', to: 'messages#new', as: :contact
  post 'contact', to: 'messages#create'
  root to: 'events#title'
  get '/', to: 'events#title'
  get '/about-us', to: 'events#about_us', as: :about
  get '/team', to: 'events#team', as: :team
  get '/contacts', to: 'events#contacts', as: :contacts

end
