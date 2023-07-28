class HoteisController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy ]

  # GET /hoteis or /hoteis.json
  def index
    @hoteis = Hotel.all.page(params[:page])
    @hospedes = Hospede.all
    @reservas = Reserva.all
    
  end

  # GET /hoteis/1 or /hoteis/1.json
  def show
  end

  # GET /hoteis/new
  def new
    @hotel = Hotel.new
  end

  # GET /hoteis/1/edit
  def edit
  end

  # POST /hoteis or /hoteis.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to hotel_url(@hotel), notice: "Hotel criado com sucesso." }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hoteis/1 or /hoteis/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to hotel_url(@hotel), notice: "Hotel atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hoteis/1 or /hoteis/1.json
  def destroy
    @hotel.destroy

    respond_to do |format|
      format.html { redirect_to hoteis_url, notice: "Hotel deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:nome, :endereco)
    end
end
