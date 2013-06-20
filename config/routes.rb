# -*- encoding : utf-8 -*-
Anybuy::Application.routes.draw do

  devise_for :users do
  end

  resources :products

  resources :bids
    match '/bid' => 'bid#biding'

  resources :about do
    collection do
    get :message
    get :home
    end
   end

    match 'help/contact_index' => 'help#contact_index', :via => [:get]
    match 'help/contact_show/:id' => 'help#contact_show', :as => "contact_show", :via => [:get]
    match 'help/contact' => 'help#contact', :via => [:get]
    match 'help/contact_create' => 'help#contact_create', :via => [:post]
    match 'help/contact_destroy/:id' => 'help#contact_destroy', :via => [:delete]
    get "help/tiro"
    get "help/question"


  mount Ckeditor::Engine => '/ckeditor'

  get "member/index"

  get "order/buymoney"

  get "other/clause1"

  get "other/clause2"

  # The priority is based upon order of creation:
  # first created -> highest priority.

    #post "bids/biding" => "bid#update"
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
   root :to => 'products#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
