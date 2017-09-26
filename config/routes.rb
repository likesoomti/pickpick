Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'common#index'
  root "common#index"
  
  # 사용자가 예약 폼을 작성하는 곳 tykim 0927
  get 'choice_space' => "reservation#user_choice_space_option"
  
  # 호스트가 사용자의 예약 폼을 받아보는 곳 tykim0927
  get 'accept_user' => "admin#admin_accept_user"
  
  post'accept_user' =>"admin#admin_accept_user"
  
  
  
end
