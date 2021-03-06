Rails.application.routes.draw do
  get '/apis/mailer' => 'apis#mailer'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "admins#index"
  resources :services
  resources :collaborators
  resources :clients
  resources :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
