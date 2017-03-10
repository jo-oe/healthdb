Rails.application.routes.draw do
  get 'contacts/export'
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

  get 'main/index'
  get 'main/backup'
  get 'main/getbackup'

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

  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
