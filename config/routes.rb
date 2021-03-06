ActionController::Routing::Routes.draw do |map|
  map.connect 'sandbox/:action', :controller => "sandbox"
  map.resources :category
  map.connect  'category/:action/:id', :controller => "category"
  map.resources :admin

  map.with_options(:controller => "diseases", :name_prefix => "disease_") do |disease|
    disease.welcome 'diseases/welcome', :action => "welcome"
    disease.suggest 'diseases/suggest', :action => "suggest"
    map.resources :diseases    
  
  end

  map.with_options(:controller => "search", :name_prefix => "search_") do |search|
    search.connect 'search/:action/:id'
    search.start 'search', :action => "step1"
    search.step2 'search/step2/:id', :action => "step2"
    search.step3 'search/step3/:id', :action => "step3"
    search.step4 'search/step4/:id', :action => "step4"
  end

  map.with_options(:controller => "user", :name_prefix => "user_") do |user|
    user.connect 'user/remote/:do', :action => "remote"
    user.connect 'user', :action => "index"
    user.login 'user/login',  :action => "login"
    user.join  'user/join',  :action => 'join'
    user.logout 'user/logout',  :action => "logout"
    user.index 'user/index',  :action => "index"
    user.welcome 'user/welcome',  :action => "welcome"
    user.connect 'user/change_profile/:id', :action => "change_profile"
    user.connect 'user/update_picture', :action => "update_picture"
    user.connect 'user/get_current_profile/:id', :action => "get_current_profile"
    map.resources :user
  end

  map.with_options(:controller => "resource", :name_prefix => "resource_") do |r|    
    r.index 'resource/index/:id', :action => "index", :group => "cat"
    r.connect 'resource/remote/:do', :action => "remote"
    r.summary 'resource/summary/:id', :action => "summary"    
    r.filter 'resource/filter', :action => "filter"
    r.new 'resource/index?add=true', :action => "index", :controller => "resource"
    r.edit 'resource/edit/:section/:id', :action => "edit"
    r.overview 'resource/overview/:method/:id', :action => "overview"
    r.connect 'resource/update_listing/:id', :action => "update_listing"
    r.connect 'resource/update_details/:id', :action => "update_details"    
  end
  map.resources :resource, :controller => "resource"
  
  map.with_options(:controller => "profile", :name_prefix => "profile_") do |p|
    p.new 'profile/new/:id', :action => "new"
    p.edit 'profile/edit/:id', :action => "edit"
    p.create 'profile/create/:id', :action => 'create'
  end
  map.resources :profiles, :controller => "profile"

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  #  map.connect ':controller/:action/:id'
  #  map.connect ':controller/:action/:id.:format'
  #
  map.root :controller => "splashpage", :action => "index"
 
end
