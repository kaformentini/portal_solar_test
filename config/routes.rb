Rails.application.routes.draw do

  root to: 'power_generators#index'

  resources :home, only: %i[index]
  resources :recommended_searches, only: %i[ new create show ]

  resources :power_generators, only: %i[index show] do
    get "search", on: :collection
    get "freight", on: :member
    get "calculation_freight", on: :member
  end

  resources :freight, only: %i[] do
    # get "cep", on: :collection
  end
  
end
