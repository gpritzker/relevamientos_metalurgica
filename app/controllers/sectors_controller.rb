class SectorsController < ApplicationController
  before_action :set_sector, only: %i[ show edit update destroy ]

  # GET /sectors or /sectors.json
  def index
    @sectors = Sector.order(:nombre).page(params[:page]).per(10)
  end

  # GET /sectors/1 or /sectors/1.json
  def show
  end

  # GET /sectors/new
  def new
    @sector = Sector.new
  end

  # GET /sectors/1/edit
  def edit
  end

  # POST /sectors or /sectors.json
  def create
    @sector = Sector.new(sector_params)

    respond_to do |format|
      if @sector.save
        format.html { redirect_to @sector, notice: "Sector creado correctamente." }
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sectors/1 or /sectors/1.json
  def update
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to @sector, notice: "Sector editado correctamente." }
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectors/1 or /sectors/1.json
  def destroy
    @sector.destroy!

    respond_to do |format|
      format.html { redirect_to sectors_path, status: :see_other, notice: "Sector eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sector_params
      params.require(:sector).permit(:nombre)
    end
end
