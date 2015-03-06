Rails.application.routes.draw do
 	root "pastries#index"
  # The resources below essentially gives more URLs. The resources :pastries nested inside resources :users essentially makes the URL /users/:id/patries/new for everything except index and show
  
	resources :pastries do
		resources :orders, only: [:new, :create, :show]
	end	



	resources :users, except: [:show, :index] do
  		resources :pastries, only: [:index]
	end

	resources :orders, only: :show
	resource :session

end
