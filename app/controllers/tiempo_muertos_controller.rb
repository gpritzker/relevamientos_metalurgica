class TiempoMuertosController < ApplicationController
  before_action :set_tiempo_muerto, only: %i[ show edit update destroy ]
  before_action :authenticate_usuario!

  # GET /tiempo_muertos or /tiempo_muertos.json
  def index
    @tiempos_muertos = TiempoMuerto.all.includes(:tipo_tiempo_muerto)
  end


  # GET /tiempo_muertos/1 or /tiempo_muertos/1.json
  def show
  end

  # GET /tiempo_muertos/new
  def new
    @tiempo_muerto = TiempoMuerto.new
  end

  # GET /tiempo_muertos/1/edit
  def edit
  end

  # POST /tiempo_muertos or /tiempo_muertos.json
  def create
    @tiempo_muerto = TiempoMuerto.new(tiempo_muerto_params)

    respond_to do |format|
      if @tiempo_muerto.save
        format.html { redirect_to @tiempo_muerto, notice: "Tiempo muerto creado correctamente." }
        format.json { render :show, status: :created, location: @tiempo_muerto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tiempo_muerto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiempo_muertos/1 or /tiempo_muertos/1.json
  def update
    respond_to do |format|
      if @tiempo_muerto.update(tiempo_muerto_params)
        format.html { redirect_to @tiempo_muerto, notice: "Tiempo muerto editado correctamente." }
        format.json { render :show, status: :ok, location: @tiempo_muerto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tiempo_muerto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiempo_muertos/1 or /tiempo_muertos/1.json
  def destroy
    @tiempo_muerto.destroy!

    respond_to do |format|
      format.html { redirect_to tiempo_muertos_path, status: :see_other, notice: "Tiempo muerto eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tiempo_muerto
      @tiempo_muerto = TiempoMuerto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tiempo_muerto_params
      params.require(:tiempo_muerto).permit(:parte_diario_id, :tipo_tiempo_muerto_id, :hora_inicio, :hora_fin, :observaciones)
    end
end
