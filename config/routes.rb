Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v0 do
      resources :pings, only: [:index], constraints: { format: 'json' }
    end
    namespace :v1, defaults: { format: :json }  do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
      resources :performance_data, only: [:create, :index]
    end
  end
end
