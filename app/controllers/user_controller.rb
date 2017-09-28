# 2017.09.25 soomti
# UserController create
# 사용자 관련 컨트롤러. 
class UserController < ApplicationController
    before_action :set_user, only: [:facebook_add_info, :infoget]
 #   before_filter :authenticate_user!
    # 가게 검색 
    # 로그인 / 회원가입

    # soomti
    # facebook test controller

    # 추가 정보 입력하는 페이지.
    # 이름과 휴대폰 번호를 입력한다.
    def facebook_add_info 
      # user가 로그인 상태가 아니라면 이전 페이지로 돌린다.
      unless user_signed_in? 
        redirect_to user_facebook_test_path
      else
        if @user.user_level == '1'
          redirect_to '/'
        end
      end
      # 권한이 1일경우 메인 페이지로 돌린다.
    end

    # 처음 시작하는 페이지
    def facebook_test
    end

    def infoget
      # 부가 정보를 입력한다.
      @user.user_name = params[:username]
      @user.phone_number = params[:phone]
      # 부가 정보를 입력하면 level을 1로 바꾼다.
      
      # 유효성 검사 후 1로 수정하는 코드 필요할듯.
      @user.user_level = (@user.user_level.to_i)+1
      @user.save
      redirect_to user_facebook_test_path
    end
  
    private
    def set_user
      @user = current_user
    end
end
