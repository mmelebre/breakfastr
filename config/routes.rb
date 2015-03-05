Rails.application.routes.draw do
  get 'pastries/index'

  get 'pastries/show'

  get 'pastries/new'

  get 'pastries/edit'

  root "pastries#index"

end
