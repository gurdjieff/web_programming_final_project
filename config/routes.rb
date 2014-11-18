Rails.application.routes.draw do
  get 'subjects/show'

  get 'courses/modify'

  get 'courses/show'

  get 'feedback_search/show'

  get 'feedback_search/search'

  resources :users       # NEW LINE
  resources :feedbacks, only:[:new, :show, :create]  # NEW LINE
  resources :sessions, only: [:new, :create, :destroy]  # NEW LINE
  resources :courses, only: [:show, :destroy]  # NEW LINE

  # resources :feedbacks
  # get 'users/new'

  root to: 'static_pages#home'
  match '/help',    to: 'static_pages#help' , via: 'get'
  match '/about',   to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/signup',  to: 'users#new', via: 'get'
  match '/userShow',  to: 'users#show', via: 'get'

  match '/signin',  to: 'sessions#new', via: 'get'         # NEW LINE
  match '/signout', to: 'sessions#destroy', via: :delete    # NEW LINE
  match '/feedbackShow', to: 'feedbacks#show', via: 'get'    # NEW LINE
  match '/myFeedbackShow', to: 'feedbacks#showMyFeedback', via: 'get'    # NEW LINE
  match '/feedbackCreate', to: 'feedbacks#new', via: 'get'
  match '/feedbackSearch', to: 'feedbacks#search', via: 'post'
  match '/feedbackSearch', to: 'feedbacks#search', via: 'get'
  match '/courseShow', to: 'courses#show', via: 'get'
  match '/courseModify', to: 'courses#modify', via: 'get'
  match '/deleteSubject', to: 'courses#deleteSubject', via: 'post'    # NEW LINE
  match '/deleteSubject', to: 'courses#deleteSubject', via: 'get'    # NEW LINE

  match '/studentsNoFeedback', to: 'feedbacks#showStudentsNoFeedback', via: 'get'    # NEW LINE
  match '/subjectsShow', to: 'subjects#show', via: 'get'    # NEW LINE
  match '/addSubject', to: 'courses#addSubject', via: 'post'    # NEW LINE
  match '/showCourse', to: 'courses#showCourse', via: 'get'    # NEW LINE
  match '/showSubjectInOrder', to: 'subjects#showSubjectInOrder', via: 'get'    # NEW LINE




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
