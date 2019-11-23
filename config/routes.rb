Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :home, only: %i[index]

  get 'recommendations', to: 'power_generators#recommendations'
end
