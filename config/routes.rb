Rails.application.routes.draw do
  scope :admin do
    devise_for :admin_as, controllers: { sessions: 'admin/admin_as/sessions' }
  end

  namespace :admin do
    root to: 'main#index'
    
    resources :teachers, except: :show
    resources :disciplines, except: :show
    resources :courses, except: :show 

  end
end
