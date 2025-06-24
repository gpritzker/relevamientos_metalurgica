class OperariosController < ApplicationController
  before_action :set_operario, only: %i[ show edit update destroy ]

  # GET /operarios or /operarios.json
  def index
    @operarios = Operario.order(:nombre).page(params[:page]).per(10)
  end

  # GET /operarios/1 or /operarios/1.json
  def show
  end

  # GET /operarios/new
  def new
    @operario = Operario.new
  end

  # GET /operarios/1/edit
  def edit
  end

  # POST /operarios or /operarios.json
  def create
    @operario = Operario.new(operario_params)

    respond_to do |format|
      if @operario.save
        format.html { redirect_to @operario, notice: "Operario was successfully created." }
        format.json { render :show, status: :created, location: @operario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operarios/1 or /operarios/1.json
  def update
    respond_to do |format|
      if @operario.update(operario_params)
        format.html { redirect_to @operario, notice: "Operario was successfully updated." }
        format.json { render :show, status: :ok, location: @operario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operarios/1 or /operarios/1.json
  def destroy
    @operario.destroy!

    respond_to do |format|
      format.html { redirect_to operarios_path, status: :see_other, notice: "Operario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operario
      @operario = Operario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operario_params
      params.require(:operario).permit(:nombre, :legajo, :sector, :activo)
    end
end
