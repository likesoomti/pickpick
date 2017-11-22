# 2017.09.25 soomti
# CommonController create
# root 및 공통(사용자,관리자)으로 페이지를 보여주는 컨트롤러. 
class CommonController < ApplicationController   
  # set_user 설정.
  before_action :set_user
  # to do
  # 공통 페이지 컨트롤러
  # 룸 디테일 컷

  # :: excavator ::
  def index
  end

  # 2017.10.11 soomti
  # html5 notification test
  def html5_noti
    
  end
  def chatbot
  end

  # 로그인 후 사용자 (권한 1)에게 보여줄 메인 컨트롤러
  def main
    
  end
  private
   # soomti 11.05
   # 유저 정보 추가 입력 하게 해놓음 
  def set_user
    @user = current_user
    if(@user)
      if(@user.user_level=="0")
        puts @user.user_level
        redirect_to :user_add_info
      end
    end
  end
end