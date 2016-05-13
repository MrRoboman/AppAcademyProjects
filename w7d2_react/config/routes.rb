Rails.application.routes.draw do
  root to: "static_pages#home"
  namespace :api do
    resources :todos, only: [:index, :show, :create, :destroy, :update]
  end
end
