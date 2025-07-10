class ParteProduccionsController < ApplicationController
  before_action :set_parte_produccion, only: %i[show edit update destroy]
  before_action :set_collections, only: %i[new create edit update]

  # GET /parte_produccions or /parte_produccions.json
  def index
    @sectores = Sector.all

    @parte_produccions = ParteProduccion.includes(:sector, :detalle_produccions)

    if params[:sector_id].present?
      @parte_produccions = @parte_produccions.where(sector_id: params[:sector_id])
    end

    if params[:fecha_desde].present?
      @parte_produccions = @parte_produccions.where("fecha >= ?", params[:fecha_desde])
    end

    if params[:fecha_hasta].present?
      @parte_produccions = @parte_produccions.where("fecha <= ?", params[:fecha_hasta])
    end
  end

  # GET /parte_produccions/1 or /parte_produccions/1.json
  def show
  end

  # GET /parte_produccions/new
  def new
    @parte_produccion = ParteProduccion.new
    @parte_produccion.detalle_produccions.build

    @sectores = Sector.all
    @ordenes_servicio = OrdenServicio.all
  end

  # GET /parte_produccions/1/edit
  def edit
  end

  # POST /parte_produccions or /parte_produccions.json
  def create
    @parte_produccion = ParteProduccion.new(parte_produccion_params)

    Rails.logger.debug "Params: #{parte_produccion_params.inspect}"
    Rails.logger.debug "ParteProduccion: #{@parte_produccion.inspect}"
    Rails.logger.debug "DetalleProduccions count: #{@parte_produccion.detalle_produccions.size}"
    @parte_produccion.detalle_produccions.each_with_index do |dp, i|
      Rails.logger.debug "Detalle ##{i} attrs: #{dp.attributes}"
      Rails.logger.debug "Detalle ##{i} errors: #{dp.errors.full_messages}"
    end

    if @parte_produccion.save
      redirect_to @parte_produccion, notice: 'Parte creado exitosamente.'
    else
      Rails.logger.debug "Errores en ParteProduccion: #{@parte_produccion.errors.full_messages}"
      render :new
    end
  end

  # PATCH/PUT /parte_produccions/1 or /parte_produccions/1.json
  def update
    respond_to do |format|
      if @parte_produccion.update(parte_produccion_params)
        format.html { redirect_to @parte_produccion, notice: "Parte produccion was successfully updated." }
        format.json { render :show, status: :ok, location: @parte_produccion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parte_produccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parte_produccions/1 or /parte_produccions/1.json
  def destroy
    @parte_produccion.destroy!

    respond_to do |format|
      format.html { redirect_to parte_produccions_path, status: :see_other, notice: "Parte produccion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parte_produccion
      @parte_produccion = ParteProduccion.find(params[:id])
    end
    
    def set_collections
      @sectores = Sector.all
      @ordenes_servicio = OrdenServicio.all
    end
    # Only allow a list of trusted parameters through.
    def parte_produccion_params
      params.require(:parte_produccion).permit(
        :sector_id,
        :fecha,
        detalle_produccions_attributes: [
          :componente,
          :descripcion,
          :orden_servicio_id,
          :cantidad_a_ejecutar,
          :cantidad_ejecutada,
          :observaciones,
          :aceptados,
          :rechazados,
          :firma
        ]
      )
    end
end
