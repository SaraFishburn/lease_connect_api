Rails.application.routes.draw do
  scope '/api' do
    post 'sessions/sign_in'
    delete 'sessions/sign_out'
    resources :users, except: [:update]
    patch '/users', to: 'users#update'
    put '/users', to: 'users#update'
    resources :houses
    resources :maintenances
    resources :events
    resources :documents
  end
end
