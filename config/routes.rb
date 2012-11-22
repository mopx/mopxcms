Mopxcms::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  root :to => "home#index"
  match '/:id', :to => 'active_cms/pages#show'
end
