# 2017.09.25 soomti
# ReservationController create
class ReservationsController < ApplicationController
  before_action :authenticate_user!

  # to do
    # 예약 컨트롤러

    # 가게가 예약 가능한지 체크


    # 가게가 되었다고 오케이 한 리스트
    # 둘다 승인 된 리스트

  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  # 사용자 권한 체크

  # GET /reservations
  # GET /reservations.json
  #들어온 요청들을 관리자가 보는 곳 tykim 1005
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  # 예약 폼을 전송하는 메소드
  def create
    @reservation = Reservation.new(reservation_params)

      if @reservation.save
        # 여기에 데이터를 뿌려야ㅐㅎ해해해해ㅐ ㄴ
       redirect_to @reservation, notice: '방 관리자들에게 요청을 성공적으로 전송했습니다.'
      else
       render :new
      end

      ActionCable.server.broadcast \
        "notice_channel_#{current_user.id}", { title: 'Test notice!', body: 'test message!' }

  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:people, :time, :place, :durationTime, :user_id)
    end

    # soomti 11.05
    # 유저 정보 추가 입력 하게 해놓음
    def set_user
      if(@user == nil)
        @user = current_user
        if(@user.user_level == "0")
          redirect_to :user_add_info
        end
      else
        puts "user else"
        puts @user
        redirect_to root_path
      end
    end

end
