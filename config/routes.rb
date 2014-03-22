Minijobs::Application.routes.draw do
  root to: "content#index"

  get 'me' => 'content#dashboard'
  get 'profile' => 'content#profile'

  devise_for :adults
  devise_for :kids

  resources :adults
  resources :kids
  resources :jobs do
    member do
      get 'apply' => 'jobs#apply_for_job'
      get 'application' => 'jobs#accept_job'
      get 'accept/:kid_id' => 'jobs#accept_application'
    end
  end


end
