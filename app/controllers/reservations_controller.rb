# 2017.09.25 soomti
# ReservationController create
# 사용자 관련 컨트롤러. 
class ReservationsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_user
  # 사용자 권한 체크

  # GET /reservations
  # GET /reservations.json
  #들어온 요청들을 관리자가 보는 곳 tykim 1005
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])
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
        redirect_to @reservation, notice: 'Reservation was successfully created.'
        
      else
        render :new
        
      end

      
      #ActionCable.server.broadcast \
       # "notice_channel_#{current_user.id}", { title: 'Test notice!', body: 'test message!' }

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
  
  def user_page
    @reservations = current_user.reservations
  end

  def accepts
   
    rev_content = Reservation.find(params[:id])
    puts rev_content.user_id
    rev_okay = ReservationAccept.new   
    rev_okay.user =  rev_content.user_id
    rev_okay.store = current_user.manager_store_id
    rev_okay.reservation = rev_content.id     
  
    if(params[:okay] == "0")     
      rev_okay.rev_ok = true
      
      rev_okay.user_id = rev_content.user_id
      rev_okay.reservation_id = rev_content.id
      rev_okay.store = current_user.manager_store_id
    else
      rev_okay.rev_ok = false;
    end
    rev_okay.save

    redirect_to '/admin'
  end

  def reservation_accept
    @reservation = ReservationAccept.where(user: current_user, store: params[:id],rev_ok: true)
  end

  private
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
