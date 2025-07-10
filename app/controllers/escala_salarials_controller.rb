class EscalaSalarialsController < ApplicationController
  before_action :set_escala_salarial, only: %i[ show edit update destroy ]

  # GET /escala_salarials or /escala_salarials.json
  def index
    @escala_salarials = EscalaSalarial.all
  end

  # GET /escala_salarials/1 or /escala_salarials/1.json
  def show
  end

  # GET /escala_salarials/new
  def new
    @escala_salarial = EscalaSalarial.new
  end

  # GET /escala_salarials/1/edit
  def edit
  end

  # POST /escala_salarials or /escala_salarials.json
  def create
    @escala_salarial = EscalaSalarial.new(escala_salarial_params)

    respond_to do |format|
      if @escala_salarial.save
        format.html { redirect_to @escala_salarial, notice: "Escala salarial was successfully created." }
        format.json { render :show, status: :created, location: @escala_salarial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @escala_salarial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escala_salarials/1 or /escala_salarials/1.json
  def update
    respond_to do |format|
      if @escala_salarial.update(escala_salarial_params)
        format.html { redirect_to @escala_salarial, notice: "Escala salarial was successfully updated." }
        format.json { render :show, status: :ok, location: @escala_salarial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @escala_salarial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escala_salarials/1 or /escala_salarials/1.json
  def destroy
    @escala_salarial.destroy!

    respond_to do |format|
      format.html { redirect_to escala_salarials_path, status: :see_other, notice: "Escala salarial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escala_salarial
      @escala_salarial = EscalaSalarial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def escala_salarial_params
      params.require(:escala_salarial).permit(:categoria, :sueldo_base, :observaciones)
    end
end
