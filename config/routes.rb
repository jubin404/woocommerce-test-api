Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'api#index'
  
  get 'test_api', to: 'api#api'
  post 'test_api', to: 'api#webhook'
end
