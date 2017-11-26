# 2017.09.25 soomti
# AdminController create
# 관리자 페이지를 보여주는 컨트롤러. 
class AdminController < ApplicationController
    before_action :set_user
    # to do
    # 예약 요청 승인

    #장소인원시간을 작성한 사용자가 예약버튼을 눌렀을 때 그 값을 보는 관리자의 화면 taeyoung 09.27
    def index
        @title = "가게 관리 페이지"
    end

    def rev_history
        @list = ReservationAccept.where(store: current_user.manager_store_id, rev_ok: true)
    end 
    
    # html5 notification
    # chatbot api 
    def booking
        @list = Reservation.all
    end

    
    # soomti 11.05
    # 유저 정보 추가 입력 하게 해놓음 
    def set_user
        @user = current_user
        if(@user)
            unless(@user.user_level == "3" || @user.user_level == "9")
                redirect_to root_path
            end
        end
    end
end