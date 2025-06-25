class TareaRealizadasController < ApplicationController
  before_action :set_tarea_realizada, only: %i[ show edit update destroy ]
  before_action :authenticate_usuario!

  # GET /tarea_realizadas or /tarea_realizadas.json
  def index
    @tareas_realizadas = TareaRealizada.all
    @tareas_realizadas = @tareas_realizadas.order(created_at: :desc).page(params[:page]).per(10)
  end

  # GET /tarea_realizadas/1 or /tarea_realizadas/1.json
  def show
  end

  # GET /tarea_realizadas/new
  def new
    @tarea_realizada = TareaRealizada.new
  end

  # GET /tarea_realizadas/1/edit
  def edit
  end

  # POST /tarea_realizadas or /tarea_realizadas.json
  def create
    @tarea_realizada = TareaRealizada.new(tarea_realizada_params)

    respond_to do |format|
      if @tarea_realizada.save
        format.html { redirect_to @tarea_realizada, notice: "Tarea realizada editada correctamente." }
        format.json { render :show, status: :created, location: @tarea_realizada }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tarea_realizada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarea_realizadas/1 or /tarea_realizadas/1.json
  def update
    respond_to do |format|
      if @tarea_realizada.update(tarea_realizada_params)
        format.html { redirect_to @tarea_realizada, notice: "Tarea realizada editada correctamente." }
        format.json { render :show, status: :ok, location: @tarea_realizada }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tarea_realizada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarea_realizadas/1 or /tarea_realizadas/1.json
  def destroy
    @tarea_realizada.destroy!

    respond_to do |format|
      format.html { redirect_to tarea_realizadas_path, status: :see_other, notice: "Tarea realizada was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarea_realizada
      @tarea_realizada = TareaRealizada.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tarea_realizada_params
      params.require(:tarea_realizada).permit(:parte_diario_id, :descripcion, :tarea_realizada, :cantidad_ejecutada, :nro_modulo, :hora_inicio, :hora_fin, :en_proceso, :finalizado, :observaciones)
    end
end
