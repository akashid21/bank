Rails.application.routes.draw do
  devise_for :users
  namespace :users do
    root to: 'page#homepage'
    get '/add_image', to: 'users#add_image'
    put '/create_image', to: 'users#create_image'
    get '/transfer', to: 'users#transfer'
    post '/execute_transfer', to: 'users#execute_transfer'
  end
end
