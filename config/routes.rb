Rails.application.routes.draw do
  get 'home/index'
  root 'home#show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "home#index"
end
