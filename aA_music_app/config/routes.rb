Rails.application.routes.draw do
  get 'band/Album'

  get 'band/Track'

  resources :users, only: [:index, :new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, except: [:new] do
    resources :tracks, only: [:new]
  end
  resources :tracks, except: [:new]

  root to: redirect("/session/new")
end
