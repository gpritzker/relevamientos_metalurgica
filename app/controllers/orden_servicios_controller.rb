class OrdenServiciosController < ApplicationController
  before_action :set_orden_servicio, only: %i[ show edit update destroy ]

  # GET /orden_servicios or /orden_servicios.json
  def index
    @orden_servicios = OrdenServicio.all
  end

  # GET /orden_servicios/1 or /orden_servicios/1.json
  def show
  end

  # GET /orden_servicios/new
  def new
    @orden_servicio = OrdenServicio.new
    @proyectos = Proyecto.all
    @tipos_orden_servicio = TipoOrdenServicio.all
  end

  def edit
    @orden_servicio = OrdenServicio.find(params[:id])
    @proyectos = Proyecto.all
    @tipos_orden_servicio = TipoOrdenServicio.all
  end
  # POST /orden_servicios or /orden_servicios.json
  def create
    @orden_servicio = OrdenServicio.new(orden_servicio_params)
    @proyectos = Proyecto.all
    @tipos_orden_servicio = TipoOrdenServicio.all

    respond_to do |format|
      if @orden_servicio.save
        format.html { redirect_to @orden_servicio, notice: "Orden servicio was successfully created." }
        format.json { render :show, status: :created, location: @orden_servicio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_servicios/1 or /orden_servicios/1.json
  def update
    respond_to do |format|
      if @orden_servicio.update(orden_servicio_params)
        format.html { redirect_to @orden_servicio, notice: "Orden servicio was successfully updated." }
        format.json { render :show, status: :ok, location: @orden_servicio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_servicios/1 or /orden_servicios/1.json
  def destroy
    @orden_servicio.destroy!

    respond_to do |format|
      format.html { redirect_to orden_servicios_path, status: :see_other, notice: "Orden servicio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_servicio
      @orden_servicio = OrdenServicio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_servicio_params
      params.require(:orden_servicio).permit(:proyecto_id, :tipo_orden_servicio_id, :descripcion, :fecha_inicio, :fecha_entrega, :estado, :observaciones)
    end
end
