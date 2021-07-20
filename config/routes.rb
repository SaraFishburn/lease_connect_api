Rails.application.routes.draw do
  scope '/api' do
    post 'sessions/sign_in'
    delete 'sessions/sign_out'
    resources :users
  end
end
