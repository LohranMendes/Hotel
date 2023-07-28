class TiposController < ApplicationController
  before_action :set_tipo, only: %i[ show edit update destroy ]

  # GET /tipos or /tipos.json
  def index
    @tipos = Tipo.all
  end

  # GET /tipos/1 or /tipos/1.json
  def show
  end

  # GET /tipos/new
  def new
    @tipo = Tipo.new
  end

  # GET /tipos/1/edit
  def edit
  end

  # POST /tipos or /tipos.json
  def create
    @tipo = Tipo.new(tipo_params)

    respond_to do |format|
      if @tipo.save
        format.html { redirect_to tipo_url(@tipo), notice: "Tipo/Diária criada com sucesso." }
        format.json { render :show, status: :created, location: @tipo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos/1 or /tipos/1.json
  def update
    respond_to do |format|
      if @tipo.update(tipo_params)
        format.html { redirect_to tipo_url(@tipo), notice: "Tipo/Diária atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @tipo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos/1 or /tipos/1.json
  def destroy
    @tipo.destroy

    respond_to do |format|
      format.html { redirect_to tipos_url, notice: "Tipo/Diária deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo
      @tipo = Tipo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_params
      params.require(:tipo).permit(:quarto)
    end
end
