Rails.application.routes.draw do
  root to: 'home#index'
  mount ActionCable.server => '/cable'


  resources :channels
  resources :offers
  resources :profiles, except: [:index, :create, :new] do
    member do
      get :public
    end
  end
  resources :offers do
    member do
      post 'join', to: 'crew_merger#join_crew'
      post 'leave', to: 'crew_merger#leave_crew'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
