Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/api/v1' do
    #  U S E R S
    get '/login', to: 'v1/users#login'
    post '/sign_up', to: 'v1/users#create'
    post '/edit_user', to: 'v1/users#update'

    #  P R O D U C T S
    get '/all_products', to: 'v1/products#index'
    get '/get_product', to: 'v1/products#show'
    post '/add_product', to: 'v1/products#create'
    delete '/delete_product', to: 'v1/products#destroy'
    put '/update_product', to: "v1/products#update"

    # O R D E R S
    post '/new_order', to: 'v1/orders#create'
    delete '/delete_order', to: 'v1/orders#destroy'
  end
end
