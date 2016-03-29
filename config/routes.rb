Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update, :destroy]
  resources :contacts, only: [:create, :update, :destroy]
  resources :contact_shares, only: [:create, :destroy]
  resources :comments, only: [:show]

  resources :users, only: [:show] do
    resources :contacts, only: [:index]
    resources :comments, only: [:create, :destroy, :update]
  end

  resources :contacts, only: [:show] do
    resources :comments, only: [:index]
  end
  # get 'users/' => 'users#index'
  # post 'users/' => 'users#create'
  # get 'users/new' => 'users#new', :as => 'new_user'
  # get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  # get 'users/:id' => 'users#show', :as => 'user'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
end
