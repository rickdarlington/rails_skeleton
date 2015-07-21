Rails.application.routes.draw do
  devise_for :users, :skip => [:sessions]
  as :user do
    get '/join' => 'devise/registrations#new', :as => :new_user_registration_path
    get '/forgotpassword' => 'devise/passwords#new', :as => :new_user_password_path
    get '/login' => 'devise/sessions#new', :as => :new_user_session
    post '/login' => 'devise/sessions#create', :as => :user_session
    get '/logout' => 'devise/sessions#destroy', :as => :destroy_user_session
    get '/account/update' => 'devise/registrations#edit', :as => :edit_user_registration_path
  end

  resources :todos

  root 'defaults#home'
  
#resources :photos
#default resourceful routes:

#HTTP Verb  Path           Controller#Action  Used for
#GET        /photos           photos#index    display a list of all photos
#GET        /photos/new       photos#new      return an HTML form for creating a new photo
#POST       /photos           photos#create   create a new photo
#GET        /photos/:id       photos#show     display a specific photo
#GET        /photos/:id/edit  photos#edit     return an HTML form for editing a photo
#PATCH/PUT  /photos/:id       photos#update   update a specific photo
#DELETE     /photos/:id       photos#destroy  delete a specific photo


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
