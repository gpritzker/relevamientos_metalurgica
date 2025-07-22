class TipoObrasController < ApplicationController
  before_action :set_tipo_obra, only: %i[ show edit update destroy ]

  # GET /tipo_obras or /tipo_obras.json
  def index
    @tipo_obras = TipoObra.all
  end

  # GET /tipo_obras/1 or /tipo_obras/1.json
  def show
  end

  # GET /tipo_obras/new
  def new
    @tipo_obra = TipoObra.new
  end

  # GET /tipo_obras/1/edit
  def edit
  end

  # POST /tipo_obras or /tipo_obras.json
  def create
    @tipo_obra = TipoObra.new(tipo_obra_params)

    respond_to do |format|
      if @tipo_obra.save
        format.html { redirect_to @tipo_obra, notice: t("flash.created", model: "Tipo obra") }
        format.json { render :show, status: :created, location: @tipo_obra }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_obra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_obras/1 or /tipo_obras/1.json
  def update
    respond_to do |format|
      if @tipo_obra.update(tipo_obra_params)
        format.html { redirect_to @tipo_obra, notice: t("flash.updated", model: "Tipo obra") }
        format.json { render :show, status: :ok, location: @tipo_obra }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_obra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_obras/1 or /tipo_obras/1.json
  def destroy
    @tipo_obra.destroy!

    respond_to do |format|
      format.html { redirect_to tipo_obras_path, status: :see_other, notice: t("flash.destroyed", model: "Tipo obra") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_obra
      @tipo_obra = TipoObra.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_obra_params
      params.require(:tipo_obra).permit(:nombre)
    end
end
