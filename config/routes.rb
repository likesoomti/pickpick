Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'common#index'

  # 2017.09.28 soomti 
  # 페이스북 추가 정보 페이지 
  get 'user/facebook_add_info'
  # 가입 화면. 페이스북 버튼 클릭 테스트 페이지 
  get 'user/facebook_test'
  # 페이스북 추가 정보 저장 
  post 'user/infoget'

  
  # 사용자가 예약 폼을 작성하는 곳 tykim 0927
  get 'choice_space' => "reservation#user_choice_space_option"
  
  # 호스트가 사용자의 예약 폼을 받아보는 곳 tykim0927
  get 'accept_user' => "admin#admin_accept_user"

  post'accept_user' =>"admin#admin_accept_user"
  
  
  
end
