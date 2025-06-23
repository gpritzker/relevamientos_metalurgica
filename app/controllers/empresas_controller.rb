# app/controllers/empresas_controller.rb
class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[show edit update destroy]

  def index
    @empresas = Empresa.all
  end

  def show; end

  def new
    @empresa = Empresa.new
  end

  def edit; end

  def create
    @empresa = Empresa.new(empresa_params)
    if @empresa.save
      redirect_to @empresa, notice: "Empresa creada correctamente."
    else
      render :new
    end
  end

  def update
    if @empresa.update(empresa_params)
      redirect_to @empresa, notice: "Empresa actualizada correctamente."
    else
      render :edit
    end
  end

  def destroy
    @empresa.destroy
    redirect_to empresas_url, notice: "Empresa eliminada correctamente."
  end

  private

  def set_empresa
    @empresa = Empresa.find(params[:id])
  end

  def empresa_params
    params.require(:empresa).permit(:nombre)
  end
end