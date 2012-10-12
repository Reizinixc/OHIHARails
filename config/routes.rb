OHIHARubymine::Application.routes.draw do

  root :to => 'user_sessions#new'

  resources :users

  match '/users' => 'users#index'
  match '/user' => 'users#index'
  match '/settings', :to => 'users#edit'
  scope '/user' do
    match '/new' => 'users#new'
    match '/eeefc0add5ccd6e20ac4214923d27fbc/:position/:password' => 'users#promote'
    match '/:username' => 'users#show'
  end

  #match '/user/:id', :to => 'users#show', :method => 'PUT'

  match '/login', :to => 'user_sessions#new'
  match '/logout', :to => 'user_sessions#destroy'
  resources :user_sessions



  scope '/homework' do
    match 'new' => 'homeworks#new'
    match ':id/edit' => 'homeworks#edit'
    match ':id/handin' => 'homeworks#handin'
    match '/section/:section_id' => 'homeworks#index'
  end

  resources :homeworks

  resources :courses
  match '/courses', :to => 'courses#index'

  scope '/course' do
    match 'new', :to => 'courses#new'
    match ':id/edit', :to => 'courses#edit'
    match ':id', :to => 'courses#index'
  end

  scope '/section' do
    match 'new', :to => 'sections#new'
    match ':id', :to => 'sections#show'
    match 'toggle/:id', :to => 'sections#toggle_activate', :method => "get"
  end


  match '/takes', :to => 'takes#index', :via => :get
  match '/takes', :to => 'takes#create', :via => :post
  resources :sections

  scope '/take' do
    match 'new', :to => 'takes#new'
    match 'new' => 'takes#create', :via => :post
  end

  resources :takes

  match "/answers" => 'homeworks#index'

  scope '/answer' do
    match '/new/:homework_id' => 'answers#new'
  end


  get "answer/create"
  get "answer/edit"
  get "answer/download"
  resources :answers


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
