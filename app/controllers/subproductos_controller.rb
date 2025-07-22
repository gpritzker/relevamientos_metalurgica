class SubproductosController < ApplicationController
  before_action :set_subproducto, only: %i[ show edit update destroy ]

  # GET /subproductos or /subproductos.json
  def index
    @subproductos = Subproducto.all
  end

  # GET /subproductos/1 or /subproductos/1.json
  def show
  end

  # GET /subproductos/new
  def new
    @subproducto = Subproducto.new
  end

  # GET /subproductos/1/edit
  def edit
  end

  # POST /subproductos or /subproductos.json
  def create
    @subproducto = Subproducto.new(subproducto_params)

    respond_to do |format|
      if @subproducto.save
        format.html { redirect_to @subproducto, notice: "Subproducto creado correctamente." }
        format.json { render :show, status: :created, location: @subproducto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subproducto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subproductos/1 or /subproductos/1.json
  def update
    respond_to do |format|
      if @subproducto.update(subproducto_params)
        format.html { redirect_to @subproducto, notice: "Subproducto actualizado correctamente." }
        format.json { render :show, status: :ok, location: @subproducto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subproducto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subproductos/1 or /subproductos/1.json
  def destroy
    @subproducto.destroy!

    respond_to do |format|
      format.html { redirect_to subproductos_path, status: :see_other, notice: "Subproducto eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subproducto
      @subproducto = Subproducto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subproducto_params
      params.require(:subproducto).permit(:nombre, :producto_id, :sector_id)
    end
end
