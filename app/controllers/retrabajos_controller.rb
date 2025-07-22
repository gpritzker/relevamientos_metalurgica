class RetrabajosController < ApplicationController
  before_action :set_retrabajo, only: %i[ show edit update destroy ]

  # GET /retrabajos or /retrabajos.json
  def index
    @retrabajos = Retrabajo.all
  end

  # GET /retrabajos/1 or /retrabajos/1.json
  def show
  end

  # GET /retrabajos/new
  def new
    @retrabajo = Retrabajo.new
  end

  # GET /retrabajos/1/edit
  def edit
  end

  # POST /retrabajos or /retrabajos.json
  def create
    @retrabajo = Retrabajo.new(retrabajo_params)

    respond_to do |format|
      if @retrabajo.save
        format.html { redirect_to @retrabajo, notice: "Retrabajo creado correctamente." }
        format.json { render :show, status: :created, location: @retrabajo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @retrabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retrabajos/1 or /retrabajos/1.json
  def update
    respond_to do |format|
      if @retrabajo.update(retrabajo_params)
        format.html { redirect_to @retrabajo, notice: "Retrabajo actualizado correctamente." }
        format.json { render :show, status: :ok, location: @retrabajo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @retrabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retrabajos/1 or /retrabajos/1.json
  def destroy
    @retrabajo.destroy!

    respond_to do |format|
      format.html { redirect_to retrabajos_path, status: :see_other, notice: "Retrabajo eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retrabajo
      @retrabajo = Retrabajo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def retrabajo_params
      params.require(:retrabajo).permit(:detalle_produccion_id, :motivo, :descripcion)
    end
end
