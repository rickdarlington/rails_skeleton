Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :passwords, :confirmations, :registrations, :unlocks]
  devise_scope :user do
    
    #send auth'd users to their application, or unauth'd to default homepage
    unauthenticated :user do
      root to: 'defaults#home', as: 'not_signed_up'
    end
    authenticated :user do
      root to: 'todos#index', as: 'applicaiton_context'
    end

    post '/login', to: 'devise/sessions#create', as: 'user_session'
    get '/login', to: 'devise/sessions#new', :as => :new_user_session
    get '/logout', to: 'devise/sessions#destroy', as: 'destroy_user_session'

    # registrations
    get '/join', to: 'devise/registrations#new', as: 'new_user_registration'
    post '/join', to: 'devise/registrations#create', as: 'user_registration'

    #reset password
    get '/forgotpassword', to: 'devise/passwords#new', as: 'new_user_password'
    put  '/forgotpassword', to: 'devise/passwords#update', as: 'user_password'
    post '/forgotpassword', to: 'devise/passwords#create'
    get '/forgotpassword/change', to: 'devise/passwords#edit', as: 'edit_user_password'

    # user accounts
    scope '/account' do
      # confirmation - confirmation is currently disabled
      #get '/verification', to: 'devise/confirmations#verification_sent', as: 'user_verification_sent'
      #get '/confirm', to: 'devise/confirmations#show', as: 'user_confirmation'
      #get '/confirm/resend', to: 'devise/confirmations#new', as: 'new_user_confirmation'
      #post '/confirm', to: 'devise/confirmations#create'

      # unlocks - locking is currently disabled
      #post '/unlock', to: 'devise/unlocks#create', as: 'user_unlock'
      #get '/unlock/new', to: 'devise/unlocks#new', as: 'new_user_unlock'
      #get '/unlock', to: 'devise/unlocks#show'

      # settings & cancellation
      # get '/cancel', to: 'devise/registrations#cancel', as: 'cancel_user_registration'
      # get '/settings', to: 'devise/registrations#edit', as: 'edit_user_registration'
      # put '/settings', to: 'devise/registrations#update'
      # account deletion
      # delete '', to: 'devise/registrations#destroy'
    end
  #end devise scope
  end

  resources :todos
  
  #info site routes:
  get '/', to: 'defaults#home'
  get '/about', to: 'defaults#about'
  get '/help', to: 'defaults#help'

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
