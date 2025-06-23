class TipoTiempoMuertosController < ApplicationController
  before_action :set_tipo_tiempo_muerto, only: %i[ show edit update destroy ]
  before_action :authenticate_usuario!

  # GET /tipo_tiempo_muertos or /tipo_tiempo_muertos.json
  def index
    @tipo_tiempo_muertos = TipoTiempoMuerto.all
  end

  # GET /tipo_tiempo_muertos/1 or /tipo_tiempo_muertos/1.json
  def show
  end

  # GET /tipo_tiempo_muertos/new
  def new
    @tipo_tiempo_muerto = TipoTiempoMuerto.new
  end

  # GET /tipo_tiempo_muertos/1/edit
  def edit
  end

  # POST /tipo_tiempo_muertos or /tipo_tiempo_muertos.json
  def create
    @tipo_tiempo_muerto = TipoTiempoMuerto.new(tipo_tiempo_muerto_params)

    respond_to do |format|
      if @tipo_tiempo_muerto.save
        format.html { redirect_to @tipo_tiempo_muerto, notice: "Tipo tiempo muerto was successfully created." }
        format.json { render :show, status: :created, location: @tipo_tiempo_muerto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_tiempo_muerto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_tiempo_muertos/1 or /tipo_tiempo_muertos/1.json
  def update
    respond_to do |format|
      if @tipo_tiempo_muerto.update(tipo_tiempo_muerto_params)
        format.html { redirect_to @tipo_tiempo_muerto, notice: "Tipo tiempo muerto was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_tiempo_muerto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_tiempo_muerto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_tiempo_muertos/1 or /tipo_tiempo_muertos/1.json
  def destroy
    @tipo_tiempo_muerto.destroy!

    respond_to do |format|
      format.html { redirect_to tipo_tiempo_muertos_path, status: :see_other, notice: "Tipo tiempo muerto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_tiempo_muerto
      @tipo_tiempo_muerto = TipoTiempoMuerto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_tiempo_muerto_params
      params.require(:tipo_tiempo_muerto).permit(:nombre)
    end
end
