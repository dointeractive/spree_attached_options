Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :products do
      resources :attached_option_types
    end
  end
end
