Rails.application.routes.draw do
  get 'main_menu/index'

  get 'citizenships/typeahead/:query' => 'citizenships#typeahead'

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
