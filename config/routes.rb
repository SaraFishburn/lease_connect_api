Rails.application.routes.draw do
  scope '/api' do
    post 'sessions/sign_in'
    delete 'sessions/sign_out'
    resources :users, except: [:update]
    patch '/users', to: 'users#update'
    put '/users', to: 'users#update'
    get '/user', to: 'users#show'
    resources :houses do
      resources :documents
    end
    resources :maintenances
    resources :events
  end
end
