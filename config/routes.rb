Rails.application.routes.draw do
  resources :contacts
  resources :referralcaritas
  resources :counselledpersons
  resources :failedinsurances
  resources :successfulinsurances
  resources :referralauthorities
  resources :referralmedicals
  resources :referralothercounsellings
  resources :referraldiakonies
  resources :referrals
  resources :healthproblems
  resources :insuranceproblems
  resources :translatoruseds
  resources :insurancestatuses
  resources :contactreasons
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get 'main_menu/index'

  get 'citizenships/typeahead/:query' => 'citizenships#typeahead'

  resources :users
  resources :clients
  resources :sexes
  resources :referrers
  resources :familystatuses
  resources :legalstatuses
  resources :homeplaces
  resources :citizenships do
    collection do
      get :autocomplete
    end
  end

  root 'main_menu#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
