Rails.application.routes.draw do
  namespace :admin do
    root to: 'main#index'
    
    get 'main/index'
    resources :teachers, except: :show
  end
end
