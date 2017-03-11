Rails.application.routes.draw do
  get '/'=>'main#student_index'
  get '/login'=>'authentication#login_get'
  post '/login'=>'authentication#login'
  get '/signup'=>'authentication#signup_get'
  post '/signup'=>'authentication#signup'
  get '/logout'=>'authentication#logout'
  get '/student_index'=>'main#student_index'
  get '/teacher_index'=>'main#teacher_index'
  get '/add_course'=>'main#add_course'
  post '/add_course_post'=>'main#add_course_post'
  get '/display_courses/:genre'=>'main#display_courses'
  get '/teacher_display_courses/:genre'=>'main#teacher_display_courses'
  post '/enroll'=>'main#enroll'
  get '/study_course'=>'main#study_course'
  post '/toggle_completed'=>'main#toggle_completed'
  get '/update_course'=>'main#update_course'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
