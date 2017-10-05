Rails.application.routes.draw do
  resources :reservations
  
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 2017.09.29 excavator
  # common page
  root 'common#index'

  get '/common/index'
  get '/common/elements'
  get '/common/generic'
  get '/common/landing'


  # 2017.09.28 soomti
  # 페이스북 추가 정보 페이지
  get 'user/facebook_add_info'
  # 가입 화면. 페이스북 버튼 클릭 테스트 페이지
  get 'user/facebook_test'
  # 페이스북 추가 정보 저장
  post 'user/infoget'


end
