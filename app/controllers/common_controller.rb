# 2017.09.25 soomti
# CommonController create
# root 및 공통(사용자,관리자)으로 페이지를 보여주는 컨트롤러. 
class CommonController < ApplicationController   
    # set_user 설정.
    before_action :set_user, only: [:index]
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

    private
    def set_user
      @user = current_user
    end
end
