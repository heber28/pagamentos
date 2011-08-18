App::Application.routes.draw do

  match 'user/edit' => 'users#edit', :as => :edit_current_user

  match 'signup' => 'users#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  resources :sessions

  resources :users

  resources :clientes do
    resources :pagamentos
  end

  resources :password_resets

  match "/list" => "clientes#list"

  match "/search" => "pagamentos#search"

  match "/receipt" => "pagamentos#receipt"

  root :to => "sessions#new"

end
