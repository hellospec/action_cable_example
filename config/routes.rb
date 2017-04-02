Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :discussions do
    resources :comments
  end

  root "discussions#index"

  mount ActionCable.server, at: "/cable"
end
