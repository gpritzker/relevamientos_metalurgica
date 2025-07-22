class DocumentoProyectosController < ApplicationController
  before_action :set_documento_proyecto, only: %i[ show edit update destroy ]

  # GET /documento_proyectos or /documento_proyectos.json
  def index
    @documento_proyectos = DocumentoProyecto.all
  end

  # GET /documento_proyectos/1 or /documento_proyectos/1.json
  def show
  end

  # GET /documento_proyectos/new
  def new
    @documento_proyecto = DocumentoProyecto.new
  end

  # GET /documento_proyectos/1/edit
  def edit
  end

  # POST /documento_proyectos or /documento_proyectos.json
  def create
    @documento_proyecto = DocumentoProyecto.new(documento_proyecto_params)

    respond_to do |format|
      if @documento_proyecto.save
        format.html { redirect_to @documento_proyecto, notice: "Documento proyecto creado correctamente." }
        format.json { render :show, status: :created, location: @documento_proyecto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @documento_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documento_proyectos/1 or /documento_proyectos/1.json
  def update
    respond_to do |format|
      if @documento_proyecto.update(documento_proyecto_params)
        format.html { redirect_to @documento_proyecto, notice: "Documento proyecto actualizado correctamente." }
        format.json { render :show, status: :ok, location: @documento_proyecto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @documento_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documento_proyectos/1 or /documento_proyectos/1.json
  def destroy
    @documento_proyecto.destroy!

    respond_to do |format|
      format.html { redirect_to documento_proyectos_path, status: :see_other, notice: "Documento proyecto eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento_proyecto
      @documento_proyecto = DocumentoProyecto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documento_proyecto_params
      params.require(:documento_proyecto).permit(:proyecto_id, :nombre, :presente, :observaciones)
    end
end
