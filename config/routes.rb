Mopxcms::Application.routes.draw do

  root :to => "pages#show", :root_page => true
  match '/robots.:format' => 'home#robots'

  match '/:locale', :to => "pages#show", :root_page => true, :as => :homepage

  scope "(/:locale)" do
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
    devise_for :users
    match '/:id', :to => 'pages#show', :as => :page
  end

end
