Rails.application.routes.draw do
  get "users/show" => "users#show"
  get "favorits/index" => "favorits#index"
  get "tops/help" => "tops#help"
  root "kpts#index"
  resources :kpts 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "tops/index" => "tops#index"
end
