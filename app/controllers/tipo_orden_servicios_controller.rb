class TipoOrdenServiciosController < ApplicationController
  before_action :set_tipo_orden_servicio, only: %i[ show edit update destroy ]

  # GET /tipo_orden_servicios or /tipo_orden_servicios.json
  def index
    @tipo_orden_servicios = TipoOrdenServicio.all
  end

  # GET /tipo_orden_servicios/1 or /tipo_orden_servicios/1.json
  def show
  end

  # GET /tipo_orden_servicios/new
  def new
    @tipo_orden_servicio = TipoOrdenServicio.new
  end

  # GET /tipo_orden_servicios/1/edit
  def edit
  end

  # POST /tipo_orden_servicios or /tipo_orden_servicios.json
  def create
    @tipo_orden_servicio = TipoOrdenServicio.new(tipo_orden_servicio_params)

    respond_to do |format|
      if @tipo_orden_servicio.save
        format.html { redirect_to @tipo_orden_servicio, notice: t("flash.created", model: "Tipo orden servicio") }
        format.json { render :show, status: :created, location: @tipo_orden_servicio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_orden_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_orden_servicios/1 or /tipo_orden_servicios/1.json
  def update
    respond_to do |format|
      if @tipo_orden_servicio.update(tipo_orden_servicio_params)
        format.html { redirect_to @tipo_orden_servicio, notice: t("flash.updated", model: "Tipo orden servicio") }
        format.json { render :show, status: :ok, location: @tipo_orden_servicio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_orden_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_orden_servicios/1 or /tipo_orden_servicios/1.json
  def destroy
    @tipo_orden_servicio.destroy!

    respond_to do |format|
      format.html { redirect_to tipo_orden_servicios_path, status: :see_other, notice: t("flash.destroyed", model: "Tipo orden servicio") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_orden_servicio
      @tipo_orden_servicio = TipoOrdenServicio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_orden_servicio_params
      params.require(:tipo_orden_servicio).permit(:nombre)
    end
end
