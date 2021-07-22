Rails.application.routes.draw do
  scope '/api' do
    post 'sessions/sign_in'
    delete 'sessions/sign_out'
    resources :users
    resources :houses
    resources :maintenances
    resources :events
    resources :documents
  end
end
