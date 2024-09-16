Rails.application.routes.draw do
  devise_for :users
  namespace :users do
    get '/homepage', to: 'page#homepage'
    root to: redirect('/homepage')
    get '/add_image', to: 'users#add_image'
    put '/create_image', to: 'users#create_image'
    get '/transfer', to: 'users#transfer'
    post '/execute_transfer', to: 'users#execute_transfer'
    get '/deposite', to: 'users#deposite'
    post '/deposite_money', to: 'users#deposite_money'
    get '/upload_avatar', to: 'avatar#edit'
    put '/upload_avatar', to: 'avatar#update'
    delete '/delete_avatar', to: 'avatar#destroy'

    resources :set_pin, only: %i[edit update]
    resources :account_histories, only: [:index]
  end
end
