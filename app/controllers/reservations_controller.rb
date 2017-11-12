# 2017.09.25 soomti
# ReservationController create
# 사용자 관련 컨트롤러. 


class ReservationsController < ApplicationController
  
  # to do
    # 예약 컨트롤러
    
    # 가게가 예약 가능한지 체크
    
   
    # 가게가 되었다고 오케이 한 리스트 
    # 둘다 승인 된 리스트 
    
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  # 사용자 권한 체크
  before_action :set_user

  # GET /reservations
  #들어온 요청들을 관리자가 보는 곳 tykim 1005
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  def show
  end

  # GET /reservations/new
  #사용자가 관리자에게 시간 장소 인원을 제출하는 폼이 있는곳 tykim1005
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # 예약 폼을 전송하는 메소드
  def create
    @reservation = Reservation.new(reservation_params)
      if @reservation.save
       redirect_to @reservation, notice: '방 관리자들에게 요청을 성공적으로 전송했습니다.' 
      else
       render :new 
      end
  end

  # PATCH/PUT /reservations/1
  # 사용자가 예약 폼을 수정할 때 tykim 1005
  def update
      if @reservation.update(reservation_params)
        redirect_to @reservation, notice: 'Reservation was successfully updated.' 
      else
        render :edit 
      end
  end

  # DELETE /reservations/1
  # 사용자가 예약요청을 취소하거나 관리자가 거절할 때  tykim 1005
  def destroy
    @reservation.destroy
      redirect_to reservations_url, notice: '사용자의요청이 성공적으로 거절되었습니다'
  end
  
  def user_destroy
    @reservation.destroy
      redirect_to @reservation, notice: '예약 요청을 취소했습니다.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      #내가 허락한 파라미터들만 불러오겠다 (나중에 유저 파라미터 추가해야됨~)
      params.require(:reservation).permit(:people, :place, :time, :durationTime)
    end
    
    # soomti 11.05
    # 유저 정보 추가 입력 하게 해놓음 
    def set_user
      if(@user)
        @user = current_user
        if(@user.user_level="0")
          redirect_to :user_add_info
        end
      end
    end
end
