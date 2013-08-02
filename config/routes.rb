Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :products do
      resources :attached_option_types
    end
  end
end
