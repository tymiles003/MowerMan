AgSystem::Application.routes.draw do

  mount Helpdesk::Engine, :at => '/helpdesk'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    
    authenticated do
      root :to => 'dashboard#dash', as: :authenticated
    end
    
    root :to => 'static_pages#home'
    
    devise_for :users # Devise resource paths
    resources :users

    resources :plantasks do
      collection do
        get :edit_multiple
        put :update_multiple
      end
    end

    resources :egg_timers

    resources :work_orders do
      collection do
        put :complete
      end
    end  

    resources :conversations, only: [:index, :show, :new, :create] do
      member do
        post :reply
        post :trash
        post :untrash
      end
    end

    resources :records, except: [:index, :edit, :destroy]
    resources :parts, except: [:index, :show]
    resources :equipment, except: [:index, :show]
    resources :areas, except: [:index, :show]
    resources :task_methods, except: [:index, :show]

    match "/search"    =>  "plantasks#search",         via: :get

    match "/dash"      =>  "dashboard#dash",           via: :get
    match "/workloads" =>  "dashboard#workloads",      via: :get
    match "/status"    =>  "dashboard#status",         via: :get
    match "/overdue"   =>  "dashboard#overdue",        via: :get
  
    match "/libraries" =>  "libraries#library",        via: :get  

    match "/mytasks"   =>   "my_task#mytasks",         via: :get

    match "/home"      =>    "static_pages#home",      via: :get
    match "/about"     =>    "static_pages#about",     via: :get
    match "/contact"   =>    "static_pages#contact",   via: :get
  end
end
