Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :products do
      resources :add_ons
    end
  end
end
