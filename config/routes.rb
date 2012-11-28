Mopxcms::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  root :to => "pages#show", :root_page => true
  match '/:id', :to => 'pages#show', :as => :page
end
