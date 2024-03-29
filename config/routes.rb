Rails.application.routes.draw do

  match '/403', to: "errors#error_403", via: :all
  match '/404', to: 'errors#error_404', via: :all
  match '/422', to: 'errors#error_422', via: :all
  match '/500', to: 'errors#error_500', via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  mount EpiCas::Engine, at: "/"
  devise_for :users
  resources :requirements do
    member do
      get :accept
      get :decline

    end
    collection do
      post :choose_suggest
      post :suggest
      get :not_found
    end
  end
  resources :users
  resources :mods
  resources :records
  get 'dashboard', to: 'records#read_records'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
