Rails.application.routes.draw do

  root to: 'power_generators#index'

  resources :home, only: %i[index]
  resources :recommended_searches, only: %i[ new create show ]

  resources :power_generators, only: %i[show] do
    get "search", on: :collection
    get "freight", on: :collection
  end

  resources :freight, only: %i[] do
  end


end
