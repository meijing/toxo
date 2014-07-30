Toxo::Application.routes.draw do
  resources :promotions

  resources :products

  resources :marks

  resources :product_types

  resources :categories

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#home'

  match 'administracion' =>'categories#management', :as =>'administracion', :via => :get
  match 'home' => 'home#home', :as =>'inicio', :via =>:get
  match 'contact' => 'home#contact', :as =>'contacto', :via =>:get
  match 'productos' => 'home#products', :as =>'productos', :via =>:get
  match 'who_are' => 'home#who_are', :as =>'who_are', :via =>:get
  match 'outlet' => 'home#outlet', :as =>'outlet', :via =>:get
  match 'our_marks' => 'home#our_marks', :as =>'our_marks', :via =>:get
  match 'all_products' => 'home#all_products', :as =>'all_products', :via =>:get
  match 'all_promotions' => 'home#promotions', :as =>'all_promotions', :via =>:get
  match 'show_promotion' => 'home#show_promotion', :as =>'show_promotion', :via =>:get
  match 'sales' => 'home#sales', :as =>'sales', :via =>:get
  match 'delete_old_promotion' => 'promotions#delete_old_promotion', :as =>'delete_old_promotion', :via =>:get
  match 'delete_new_collection' => 'products#delete_new_collection', :as =>'delete_new_collection', :via =>:get

  match 'up' => 'marks#up', :as =>'up_mark', :via =>:get
  match 'down' => 'marks#down', :as =>'down_mark', :via =>:get

  match 'create_sale' => 'product_types#create_sale', :as =>'create_sale', :via =>:get
  match 'delete_sale' => 'product_types#delete_sale', :as =>'delete_sale', :via =>:get

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
