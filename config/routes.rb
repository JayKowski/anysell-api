Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/v1' do
    post '/sign_up', to: 'v1/users#create'
    get '/login', to: 'v1/users#login'
    post '/edit', to: 'v1/users#update'
  end
end
