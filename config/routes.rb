Rails.application.routes.draw do
  # 태영 라우트 예약 페이지
  resources :space_infos
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

  # soomin test 지울거임
  get '/common/html5_noti'

  # 2017.09.28 soomti
  # 페이스북 추가 정보 페이지
  get 'user/facebook_add_info'
  # 가입 화면. 페이스북 버튼 클릭 테스트 페이지
  get 'user/facebook_test'
  # 페이스북 추가 정보 저장
  post 'user/infoget'


end
