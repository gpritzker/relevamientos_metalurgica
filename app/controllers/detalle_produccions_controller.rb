class DetalleProduccionsController < ApplicationController
  before_action :set_detalle_produccion, only: %i[ show edit update destroy ]

  # GET /detalle_produccions or /detalle_produccions.json
  def index
    @detalle_produccions = DetalleProduccion.all
  end

  # GET /detalle_produccions/1 or /detalle_produccions/1.json
  def show
  end

  # GET /detalle_produccions/new
  def new
    @detalle_produccion = DetalleProduccion.new
  end

  # GET /detalle_produccions/1/edit
  def edit
  end

  # POST /detalle_produccions or /detalle_produccions.json
  def create
    @detalle_produccion = DetalleProduccion.new(detalle_produccion_params)

    respond_to do |format|
      if @detalle_produccion.save
        format.html { redirect_to @detalle_produccion, notice: t("flash.created", model: "Detalle produccion") }
        format.json { render :show, status: :created, location: @detalle_produccion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detalle_produccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_produccions/1 or /detalle_produccions/1.json
  def update
    respond_to do |format|
      if @detalle_produccion.update(detalle_produccion_params)
        format.html { redirect_to @detalle_produccion, notice: t("flash.updated", model: "Detalle produccion") }
        format.json { render :show, status: :ok, location: @detalle_produccion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @detalle_produccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_produccions/1 or /detalle_produccions/1.json
  def destroy
    @detalle_produccion.destroy!

    respond_to do |format|
      format.html { redirect_to detalle_produccions_path, status: :see_other, notice: t("flash.destroyed", model: "Detalle produccion") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_produccion
      @detalle_produccion = DetalleProduccion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def detalle_produccion_params
      params.require(:detalle_produccion).permit(:parte_produccion_id, :descripcion, :componente, :cantidad_a_ejecutar, :cantidad_ejecutada, :aceptados, :rechazados, :hora_inicio, :hora_fin, :tiempo_empleado, :observaciones)
    end
end
