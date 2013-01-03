RailsRecurlySubscriptionSaas::Application.routes.draw do
  get "recurly/test"
  post "recurly/push"
  get "content/silver"
  get "content/gold"
  get "content/platinum"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    put 'update_plan', to: 'registrations#update_plan'
  end
  resources :users
end