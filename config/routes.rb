Rails.application.routes.draw do
  root "houses#index"

  resources :houses, only: [:index, :create, :show, :new] do
    resources :members, only: [:create, :new]
  end
end
