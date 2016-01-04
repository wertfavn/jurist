Rails.application.routes.draw do
  
  mount Attachinary::Engine => "/attachinary"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :events
  
  #root to: 'events#title'
  get '/', to: 'events#title'
  get '/about-us', to: 'events#about_us', as: :about_us
  get '/team', to: 'events#team', as: :team
  get '/contacts', to: 'events#contacts', as: :contacts
  get '/join_us', to: 'events#join_us', as: :join_us
end
