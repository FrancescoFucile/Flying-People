Rails.application.routes.draw do
	
  resources :photos
	devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :users
	resources :conversations, only: [:index, :show] 
	resources :messages, only: [:new, :create]
	resources :message_abuses, only:[:new, :create, :index]
	
	get 'users/search/:username', to: 'users#search', as: 'user_search'
  get 'photos/:id/like', to: 'photos#like', as: 'photo_like'
  post 'photos/:id/comment', to: 'photos#comment', as: 'photo_comments'
  get 'locality/:name', to: 'locality#show', as: 'locality'

	root :to => 'home#index', as: 'root'

	# Reports stuff
	resources :reports do
		resources :report_comments
	end
	get  'reports/:id/like', 				 to: 'reports#like',           as: 'report_like'
	get  'reports/:id/dislike', 	   to: 'reports#dislike',        as: 'report_dislike'

end