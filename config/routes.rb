Rails.application.routes.draw do
  get "kpts/day_kpt" => "kpts#day_kpt"
  resources :join_teams, only: [:create, :destroy]
  resources :teams do
    get :members
    get :kpts0
    get :kpts_1
    get :kpts_2
    get :kpts_3
    get :kpts_4
    get :kpts_5
    get :kpts_6
    get :kpts_7
    get :calendar
  end
  get "users/show" => "users#show"
  get "favorits/index" 
  get "tops/help" 
  root "kpts#index"
  resources :kpts 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "tops/index"
end