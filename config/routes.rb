Minijobs::Application.routes.draw do
  root to: "content#index"

  devise_for :adults
  devise_for :kids

  resources :adults
  resources :kids
  resources :jobs do
    member do
      get 'application' => 'jobs#accept_job'
      get 'accept' => 'jobs#accept_application'
    end
  end


end
