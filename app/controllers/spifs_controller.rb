class SpifsController < ApplicationController
  before_action :set_spif, only: [:show, :edit, :update, :destroy]

  # GET /spifs
  # GET /spifs.json
  def index
    @spifs = Spif.all
  end

  # GET /spifs/1
  # GET /spifs/1.json
  def show
  end

  # GET /spifs/new
  def new
    @spif = Spif.new
  end

  # GET /spifs/1/edit
  def edit
  end

  # POST /spifs
  # POST /spifs.json
  def create
    @spif = Spif.new(spif_params)

    respond_to do |format|
      if @spif.save
        format.html { redirect_to @spif, notice: 'Spif was successfully created.' }
        format.json { render :show, status: :created, location: @spif }
      else
        format.html { render :new }
        format.json { render json: @spif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spifs/1
  # PATCH/PUT /spifs/1.json
  def update
    respond_to do |format|
      if @spif.update(spif_params)
        format.html { redirect_to @spif, notice: 'Spif was successfully updated.' }
        format.json { render :show, status: :ok, location: @spif }
      else
        format.html { render :edit }
        format.json { render json: @spif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spifs/1
  # DELETE /spifs/1.json
  def destroy
    @spif.destroy
    respond_to do |format|
      format.html { redirect_to spifs_url, notice: 'Spif was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spif
      @spif = Spif.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spif_params
      params.require(:spif).permit(:name, :address, :pph, :photo, :place, :park, :smok, :wifi, :printer, :consent, :projector, :payment, :ot, :ct)
    end
end
