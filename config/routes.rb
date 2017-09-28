Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'common#index'

  get 'user/facebook_add_info'
  get 'user/facebook_test'

  post 'user/infoget'
 

end
