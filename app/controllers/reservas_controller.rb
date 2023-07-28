class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy ]

  # GET /reservas or /reservas.json
  def index
    @reservas = Reserva.all.page(params[:page])
  end

  # GET /reservas/1 or /reservas/1.json
  def show
    @reserva = Reserva.all
    @reserva = Reserva.find(params[:id])
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas or /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to reserva_url(@reserva), notice: "Reserva criada com sucesso." }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1 or /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to reserva_url(@reserva), notice: "Reserva atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1 or /reservas/1.json
  def destroy
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to reservas_url, notice: "Reserva deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  def generate

    @reservas = Reserva.all
    pdf = Prawn::Document.new

    pdf.text "Harmer - Relatório de Reservas"
    pdf.move_down 25

    @reservas.each do |reserva|
      pdf.text "=======Reserva- #{reserva.id.to_s}"
      pdf.move_down 5
      pdf.text"Hóspede: #{reserva.hospede.nome.to_s}"
      pdf.text"Hotel: #{reserva.hotel.nome.to_s}"
      pdf.text"Número do Quarto: #{reserva.quarto.num.to_s}"
      pdf.text"Tipo/Diária: #{reserva.tipo.quarto.to_s}"
      pdf.text"Inicio: #{reserva.inicio.to_s}"
      pdf.text"Fim: #{reserva.fim.to_s}"
    end
    send_data pdf.render, filename: "relatorio-de-reservas#{Date.today}.pdf", type: "application/pdf"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:inicio, :fim, :hospede_id, :tipo_id, :hotel_id, :quarto_id)
    end
end
