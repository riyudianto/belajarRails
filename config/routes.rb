Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jobs#index'
  get 'jobs/index'
  get "sign_up"=>"users#new",:as => "sign_up"
  get "/jobs_users/:id/accepted"=>"jobs_users#accepted",:as => "accepted"
  get "/jobs_users/:id/rejected"=>"jobs_users#rejected",:as => "rejected"
  get "/users/:id/jobs_users"=>"users#list_applyment",:as => "list_applyment"
  resources :users
  resources :sessions
  resources :jobs_users, :only => [:destroy, :index, :edit]
  resources :jobs do
  	resources :jobs_users, :only => [:create, :new]
  end

end
