Rails.application.routes.draw do
  root to: 'home#index'


  resources :profiles, except: [:index, :create, :new] do
    member do
      get :public
    end
  end
  resources :offers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
