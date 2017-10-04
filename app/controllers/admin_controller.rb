# 2017.09.25 soomti
# AdminController create
# 관리자 페이지를 보여주는 컨트롤러. 
class AdminController < ApplicationController
    # to do
    # 예약 요청 승인
    
    #장소인원시간을 작성한 사용자가 예약버튼을 눌렀을 때 그 값을 보는 관리자의 화면 taeyoung 09.27
    def admin_accept_user    
        @user_input_people = params[:people]
        @user_input_place = params[:place]
        @user_input_time = params[:time]
        @user_input_start_time = params[:select_start_time]
        @user_input_end_time = params[:select_end_time]
        @user_input_phonenumber = params[:phone]
    end
    # html5 notification
    # chatbot api 
end
