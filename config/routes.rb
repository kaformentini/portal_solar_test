Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :home, only: %i[index]
  resources :power_generators, only: %i[] do
    get "search", on: :collection
    get "recommendations", on: :collection
    get "advanced_search", on: :collection
  end

  get 'recommendations', to: 'power_generators#recommendations'
end
