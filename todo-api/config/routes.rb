Rails.application.routes.draw do
  use_doorkeeper
  root 'static#home'

  namespace :api do
    namespace :v1  do
      jsonapi_resources :todos
    end
  end
end
