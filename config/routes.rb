Spree::Core::Engine.routes.draw do
  devise_for :spree_user,
             :class_name => 'Spree::User',
             :controllers => { :sessions => 'spree/user_sessions',
                               :registrations => 'spree/user_registrations',
                               :passwords => 'spree/user_passwords' },
             :skip => [:unlocks, :omniauth_callbacks],
             :path_names => { :sign_out => 'logout' }
end

Spree::Core::Engine.routes.prepend do
  resources :users, :only => [:edit, :update]

  devise_scope :spree_user do
    get '/login' => 'user_sessions#new', :as => :login
    get '/artistlogin' => 'artist_sessions#new', :as => :artistlogin
    post '/artistsession' => 'artist_sessions#create', :as => :artist_session
    get '/logout' => 'user_sessions#destroy', :as => :logout
    # Necessary for #78
    get '/logout' => 'user_sessions#destroy', :as => :destroy_user_session
    get '/signup' => 'user_registrations#new', :as => :signup
  end

  match '/checkout/registration' => 'checkout#registration', :via => :get, :as => :checkout_registration
  match '/checkout/registration' => 'checkout#update_registration', :via => :put, :as => :update_checkout_registration

  match '/orders/:id/token/:token' => 'orders#show', :via => :get, :as => :token_order

  #artist profile page
  match '/artists/:id' => 'artists#show', :via => :get, :as => :artist
  match '/artist_gallery/:id' => 'artists#gallery', :via => :get, :as => :gallery

  resource :session do
    member do
      get :nav_bar
    end
  end

  resource :account, :controller => 'users'

  namespace :admin do
    resources :users
  end
end
