Rails.application.routes.draw do
  resources :bloggers, only: [:index, :show, :create, :new]
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  resources :destinations, only: :show
  get "posts/:id/like", to: "posts#like", as: "like"
end
