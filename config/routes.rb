Mopxcms::Application.routes.draw do
  get "pages/show"

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  root :to => "home#index"
  match '/:id', :to => 'pages#show', :as => :page
end
