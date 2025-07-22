class NoConformidadsController < ApplicationController
  before_action :set_no_conformidad, only: %i[ show edit update destroy ]

  # GET /no_conformidads or /no_conformidads.json
  def index
    @no_conformidads = NoConformidad.all
  end

  # GET /no_conformidads/1 or /no_conformidads/1.json
  def show
  end

  # GET /no_conformidads/new
  def new
    @no_conformidad = NoConformidad.new
  end

  # GET /no_conformidads/1/edit
  def edit
  end

  # POST /no_conformidads or /no_conformidads.json
  def create
    @no_conformidad = NoConformidad.new(no_conformidad_params)

    respond_to do |format|
      if @no_conformidad.save
        format.html { redirect_to @no_conformidad, notice: "No conformidad creado correctamente." }
        format.json { render :show, status: :created, location: @no_conformidad }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @no_conformidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /no_conformidads/1 or /no_conformidads/1.json
  def update
    respond_to do |format|
      if @no_conformidad.update(no_conformidad_params)
        format.html { redirect_to @no_conformidad, notice: "No conformidad actualizado correctamente." }
        format.json { render :show, status: :ok, location: @no_conformidad }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @no_conformidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /no_conformidads/1 or /no_conformidads/1.json
  def destroy
    @no_conformidad.destroy!

    respond_to do |format|
      format.html { redirect_to no_conformidads_path, status: :see_other, notice: "No conformidad eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_no_conformidad
      @no_conformidad = NoConformidad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def no_conformidad_params
      params.require(:no_conformidad).permit(:detalle_produccion_id, :motivo, :cantidad_afectada, :observaciones)
    end
end
