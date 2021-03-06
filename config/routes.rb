Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :members, only: [:create, :index]
      resources :invites, only: [:create]
    end
  end
end
