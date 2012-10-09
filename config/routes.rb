OHIHARubymine::Application.routes.draw do


  root :to => 'user_sessions#new'


  resources :users
  match 'user', :to => 'users#index', :method => "get"
  match '/users' => 'users#index'
  match '/user/new' => 'users#new'
  match '/user/:username' => 'users#show'
  #match '/user/:id', :to => 'users#show', :method => 'PUT'
  match '/settings', :to => 'users#edit'

  match '/login', :to => 'user_sessions#new'
  match '/logout', :to => 'user_sessions#destroy'
  resources :user_sessions


  match '/homeworks' => 'homeworks#index'

  scope '/homework' do
    match 'new', :to => 'homeworks#new'
    match ':id/edit' => 'homeworks#edit'
    match ':id/handin' => 'homeworks#handin'
  end

  resource :homeworks

  resources :sections

  resources :courses
  match '/courses', :to => 'courses#index'

  scope '/course' do
    match 'new', :to => 'courses#new'
    match ':id/edit', :to => 'courses#edit'
    match ':id', :to => 'courses#index'

  end



  namespace :section do
    match 'new', :to => 'sections#new'
    match ':id', :to => 'sections#show'
  end

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
