Rails.application.routes.draw do
  resources :users, only: [:index]
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :user_events
  resources :events

  resources :restaurant_search, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end