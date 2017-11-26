class SpaceInfosController < ApplicationController
  before_action :set_space_info, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /space_infos
  # GET /space_infos.json
  def index
    @space_infos = SpaceInfo.all
  end

  # GET /space_infos/1
  # GET /space_infos/1.json
  def show
  end

  # GET /space_infos/new
  def new
    @space_info = SpaceInfo.new
  end

  # GET /space_infos/1/edit
  def edit
  end

  # POST /space_infos
  # POST /space_infos.json
  def create
    @space_info = SpaceInfo.new(space_info_params)

    respond_to do |format|
      if @space_info.save
        format.html { redirect_to @space_info, notice: 'Space info was successfully created.' }
        format.json { render :show, status: :created, location: @space_info }
      else
        format.html { render :new }
        format.json { render json: @space_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /space_infos/1
  # PATCH/PUT /space_infos/1.json
  def update
    respond_to do |format|
      if @space_info.update(space_info_params)
        format.html { redirect_to @space_info, notice: 'Space info was successfully updated.' }
        format.json { render :show, status: :ok, location: @space_info }
      else
        format.html { render :edit }
        format.json { render json: @space_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_infos/1
  # DELETE /space_infos/1.json
  def destroy
    @space_info.destroy
    respond_to do |format|
      format.html { redirect_to space_infos_url, notice: 'Space info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_info
      @space_info = SpaceInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_info_params
      params.require(:space_info).permit(:name, :address, :price_per_hour, :ot, :ct, :tel, :photo, :parking, :smoking, :projector, :wifi, :printer, :consent, :payment, :place)
    end

    # soomti 11.05
    # 유저 정보 추가 입력 하게 해놓음 
    def set_user
      @user = current_user
      if(@user)
        if(@user.user_level == "0")
          redirect_to :user_add_info
        end
      else
        redirect_to "/"
      end
    end
end
