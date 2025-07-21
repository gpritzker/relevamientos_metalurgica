class ProyectosController < ApplicationController
  before_action :set_proyecto, only: %i[ show edit update destroy ]

  # GET /proyectos or /proyectos.json
  def index
    @proyectos = Proyecto.all
  end

  # GET /proyectos/1 or /proyectos/1.json
  def show
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
    @clientes = Cliente.all
    @tipos_obra = TipoObra.all
    @proyecto.documentos_proyecto.build
    @proyecto.proyecto_orden_servicios.build
    @ordenes_servicio = OrdenServicio.all

    # Carga datos JS globales
    @sectores = Sector.all
    @materiales = Material.all
    @subproductos = Subproducto.all
  end

  # GET /proyectos/1/edit
  def edit
  end

  # POST /proyectos or /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to @proyecto, notice: t("flash.created", model: "Proyecto") }
        format.json { render :show, status: :created, location: @proyecto }
      else
        @clientes = Cliente.all
        @tipos_obra = TipoObra.all
        @sectores = Sector.all
        @materiales = Material.all
        @subproductos = Subproducto.all

        puts "⚠️ Errores del proyecto: #{@proyecto.errors.full_messages.inspect}"

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1 or /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to @proyecto, notice: t("flash.updated", model: "Proyecto") }
        format.json { render :show, status: :ok, location: @proyecto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1 or /proyectos/1.json
  def destroy
    @proyecto.destroy!

    respond_to do |format|
      format.html { redirect_to proyectos_path, status: :see_other, notice: t("flash.destroyed", model: "Proyecto") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proyecto_params
      params.require(:proyecto).permit(
        :nombre, :cliente_id, :tipo_obra_id, :ubicacion, :plazo_contrato, :documentacion,
        documentos_proyecto_attributes: [:id, :nombre, :presente, :_destroy],
        proyecto_orden_servicios_attributes: [
          :id, :orden_servicio_id, :sector_id, :subproducto_id, :material_id,
          :descripcion, :tiempo, :_destroy
        ]
      )
    end
end
