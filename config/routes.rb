Rails.application.routes.draw do
  get 'users/new'

  get 'users/edit'

  root "pastries#index"
  # The resources below essentially gives more URLs. The resources :pastries nested inside resources :users essentially makes the URL /users/:id/patries/new for everything except index and show
  resources :pastries, only: [:index, :show]
  resources :users do

  	resources :pastries, except: [:index, :show]
end

end
