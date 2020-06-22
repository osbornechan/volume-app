Rails.application.routes.draw do
  get '/participations/index', as: 'participation'
  post '/participations/index' => 'participations#create'
  get 'profiles/index', as: 'profile'
  resources :activities
  devise_for :volunteers, { sessions: "volunteers/sessions", registrations: "volunteers/registrations" }
  devise_for :organisers, { sessions: "organisers/sessions", registrations: "organisers/registrations" }

  root 'home#index'
end