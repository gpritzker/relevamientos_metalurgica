class ParteDiariosController < ApplicationController
  before_action :set_parte_diario, only: %i[ show edit update destroy ]
  before_action :authenticate_usuario!

  # GET /parte_diarios or /parte_diarios.json
  def index
    @parte_diarios = ParteDiario.order(created_at: :desc).page(params[:page]).per(10)
  end

  # GET /parte_diarios/1 or /parte_diarios/1.json
  def show
  end

  # GET /parte_diarios/new
  def new
    @parte_diario = ParteDiario.new
    @parte_diario.tareas_realizadas.build
    @parte_diario.tiempos_muertos.build
  end

  # GET /parte_diarios/1/edit
  def edit
  end

  # POST /parte_diarios or /parte_diarios.json
  def create
    @parte_diario = ParteDiario.new(parte_diario_params)
    @parte_diario.usuario_id = current_usuario.id

    respond_to do |format|
      if @parte_diario.save
        format.html { redirect_to @parte_diario, notice: "Parte diario creado correctamente." }
        format.json { render :show, status: :created, location: @parte_diario }
      else
        flash.now[:alert] = @parte_diario.errors.full_messages.join(', ')
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parte_diario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parte_diarios/1 or /parte_diarios/1.json
  def update
    respond_to do |format|
      if @parte_diario.update(parte_diario_params)
        format.html { redirect_to @parte_diario, notice: "Parte diario editado correctamente" }
        format.json { render :show, status: :ok, location: @parte_diario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parte_diario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parte_diarios/1 or /parte_diarios/1.json
  def destroy
    @parte_diario.destroy!

    respond_to do |format|
      format.html { redirect_to parte_diarios_path, notice: "Parte diario eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parte_diario
      @parte_diario = ParteDiario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
      # def parte_diario_params
      #   params.require(:parte_diario).permit(
      #     :fecha,
      #     :turno,
      #     :usuario_id,
      #     :sector,
      #     :operario_id,
      #     :descripcion,
      #     :hora_inicio,
      #     :hora_fin,
      #     :observacion
      #   )
      # end

      def parte_diario_params
        params.require(:parte_diario).permit(
          :fecha, :sector_id, :turno, :usuario_id, :operario_id,
          tareas_realizadas_attributes: [
            :id, :descripcion, :cantidad_ejecutada, :unidad, :nro_modulo, :hora_inicio, :hora_fin, :en_proceso, :finalizado, :observaciones, :_destroy
          ],
          tiempos_muertos_attributes: [
            :id, :tipo_tiempo_muerto_id, :descripcion, :hora_inicio, :hora_fin, :observaciones, :_destroy
          ]
        )
      end
end
