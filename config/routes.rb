OHIHARubymine::Application.routes.draw do

  root :to => 'user_sessions#new'

  resources :user_sessions
  resources :users

  match '/users' => 'users#index'
  match '/user/new' => 'users#new'

  match '/user/:username' => 'users#show'

  match '/login', :to => 'user_sessions#new'
  match '/logout', :to => 'user_sessions#destroy'
  match '/settings', :to => 'users#edit'


  namespace :QuestionAnswer do
    match 'new' => "question_answer#new"
    match ':id' => "user_sessions#new"
    match 'edit/:id' => "question_answer#edit"
    match 'destroy/:id' => "question_answer#destroy"
  end

  match '/homeworks' => 'homeworks#index'

  namespace :SelfHomework do
    match '' => "self_homework#index"
    match 'new' => "self_homework#new"
    match ':id' => "self_homework#show"
    match 'edit/:id' => "self_homework#edit"
    match 'destroy/:id' => "self_homework#destroy"
  end

  namespace :QuestionHomework do

  end

  get "item/new"

  get "item/create"

  get "item/edit"

  get "item/update"

  get "item/destroy"

  get "question_homework/new"

  get "question_homework/create"

  get "question_homework/edit"

  get "question_homework/update"

  get "question_homework/destroy"

  get "self_homework/new"

  get "self_homework/create"

  get "self_homework/edit"

  get "self_homework/update"

  get "self_homework/destroy"

  get "teach/new"

  get "teach/create"

  get "teach/destroy"

  get "takes/new"

  get "takes/create"

  get "takes/destroy"

  get "ta/new"

  get "ta/create"

  get "ta/destroy"

  resources :self_homework_answer_files

  resources :sections

  resources :courses, :only => [:index]

  namespace :course do
    post '', :to => 'courses#create'
    match 'new', :to => 'courses#new'
    match ':id', :to => 'courses#show'
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
