require 'sidekiq/web'


Rails.application.routes.draw do
  root 'welcome#index'
  resources :books
  namespace :api do
    get 'qiniu' => 'qiniu#index'
  end
  
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
