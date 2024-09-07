Rails.application.routes.draw do
  devise_for :users
  namespace :users do
    root to: 'page#homepage'
    get '/add_image', to: 'users#add_image'
    put '/create_image', to: 'users#create_image'
    get '/transfer', to: 'users#transfer'
    post '/execute_transfer', to: 'users#execute_transfer'
    get '/deposite', to: 'users#deposite'
    post '/deposite_money', to: 'users#deposite_money'

    resources :account_histories, only: [:index]
  end
end
