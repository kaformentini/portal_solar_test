Rails.application.routes.draw do
  root to: 'power_generators#index'

  resources :home, only: %i[index]
  resources :recommended_searches, only: %i[ new create show ]

  resources :power_generators, only: %i[index show] do
    get 'search', on: :collection
    get 'recommended_search', on: :collection
    get 'recommended_search_result', on: :collection
    get 'freight', on: :member
    get 'calculation_freight', on: :member
  end

  resources :freight, only: %i[] do
  end
end
