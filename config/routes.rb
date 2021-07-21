Rails.application.routes.draw do
  get 'maintenances/index'
  get 'maintenances/create'
  get 'maintenances/update'
  get 'houses/index'
  get 'houses/show'
  get 'houses/create'
  get 'houses/update'
  get 'houses/destroy'
  get 'events/index'
  get 'events/create'
  get 'events/destroy'
  get 'documents/index'
  get 'documents/show'
  get 'documents/create'
  get 'documents/destroy'
  scope '/api' do
    post 'sessions/sign_in'
    delete 'sessions/sign_out'
    resources :users
  end
end
