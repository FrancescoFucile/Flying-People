Rails.application.routes.draw do
	
	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :users
	resources :conversations, only: [:index, :show] 
	resources :messages, only: [:new, :create]
	
	get 'users/search', to: 'users#search'

	root :to => 'home#index'

    resources :reports

end
