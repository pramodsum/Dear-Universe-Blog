Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :posts do
    resources :comments
  end

  root to: 'visitors#index'

  get '/about', :to => 'pages#about'

  get '/404', :to => 'errors#not_found'
  get '/500', :to => 'errors#internal_error'
  get '/422', :to => 'errors#unprocessable_entity'

end
