Rails.application.routes.draw do
  scope "/api" do
    get 'sessions/sign_in'
    get 'sessions/sign_out'
    resources :users
  end
end
