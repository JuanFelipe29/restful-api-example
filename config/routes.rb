Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :productos
      resources :ordenes
    end
  end
    

end
