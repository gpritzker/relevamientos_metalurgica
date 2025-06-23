class DashboardsController < ApplicationController
  def index
    @parte_diarios = ParteDiario.includes(:sector, :operario)

    @parte_diarios = @parte_diarios.where(sector_id: params[:sector_id]) if params[:sector_id].present?
    @parte_diarios = @parte_diarios.where(operario_id: params[:operario_id]) if params[:operario_id].present?
    @parte_diarios = @parte_diarios.where("fecha >= ?", params[:desde]) if params[:desde].present?
    @parte_diarios = @parte_diarios.where("fecha <= ?", params[:hasta]) if params[:hasta].present?

    parte_diario_ids = @parte_diarios.pluck(:id)

    @tareas = TareaRealizada.includes(:parte_diario).where(parte_diario_id: @parte_diarios.pluck(:id))
    @tiempos_muertos = TiempoMuerto.includes(parte_diario: :operario).where(parte_diario_id: @parte_diarios.pluck(:id))
  end

end
