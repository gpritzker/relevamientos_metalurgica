class DashboardsController < ApplicationController
  layout 'fullscreen', only: [:fullscreen]

  def index
    @parte_diarios = ParteDiario.includes(:sector, :operario)

    @parte_diarios = @parte_diarios.where(sector_id: params[:sector_id]) if params[:sector_id].present?
    @parte_diarios = @parte_diarios.where(operario_id: params[:operario_id]) if params[:operario_id].present?
    @parte_diarios = @parte_diarios.where("fecha >= ?", params[:desde]) if params[:desde].present?
    @parte_diarios = @parte_diarios.where("fecha <= ?", params[:hasta]) if params[:hasta].present?

    @tareas = TareaRealizada.includes(:parte_diario).where(parte_diario_id: @parte_diarios.pluck(:id))
    @tiempos_muertos = TiempoMuerto.includes(parte_diario: :operario).where(parte_diario_id: @parte_diarios.pluck(:id))
  end

  def fullscreen
    @operarios_activos = Operario.count
    @partes_del_dia = ParteDiario.where(fecha: Date.today).count

    partes_hoy = ParteDiario.where(fecha: Date.today)

    @tiempos_muertos_hoy = TiempoMuerto
      .joins(:parte_diario)
      .where(parte_diarios: { fecha: Date.today })
      .count

    @alertas = TiempoMuerto
      .joins(:parte_diario)
      .where(parte_diarios: { fecha: Date.today })
      .where.not(hora_inicio: nil, hora_fin: nil)
      .where("EXTRACT(EPOCH FROM (tiempo_muertos.hora_fin - tiempo_muertos.hora_inicio)) >= ?", 3600)
      .count

    @minutos_muertos_hoy = TiempoMuerto
      .joins(:parte_diario)
      .where(parte_diarios: { fecha: Date.today })
      .map(&:duracion_minutos)
      .sum

    @porcentaje_con_tiempo_muerto = if partes_hoy.any?
      ((partes_hoy.joins(:tiempos_muertos).distinct.count.to_f / partes_hoy.count) * 100).round
    else
      0
    end

    @top_operarios = Operario.joins(parte_diarios: :tareas_realizadas).where(parte_diarios: { fecha: Date.today }).select("operarios.*, COUNT(tarea_realizadas.id) as tareas_realizadas_count").group("operarios.id").order(Arel.sql("tareas_realizadas_count DESC")).limit(3)

    @ultimos_partes = ParteDiario
      .includes(:operario, :tareas_realizadas, :tiempos_muertos)
      .order(fecha: :desc)
      .limit(5)

    @productividad_semanal = ParteDiario
      .where.not(fecha: nil)
      .group("DATE(fecha)")
      .order("DATE(fecha)")
      .count
      .transform_keys { |f| f.strftime("%d/%m") }

    @minutos_muertos_por_dia = TiempoMuerto
    .joins(:parte_diario)
    .where("parte_diarios.fecha >= ?", 7.days.ago.to_date)
    .group("DATE(parte_diarios.fecha)")
    .pluck(
      Arel.sql("DATE(parte_diarios.fecha)"),
      Arel.sql("SUM(EXTRACT(EPOCH FROM (tiempo_muertos.hora_fin - tiempo_muertos.hora_inicio)))")
    )
    .to_h
    .transform_keys { |f| f.respond_to?(:strftime) ? f.strftime("%d/%m") : f.to_s }
    .transform_values { |seconds| (seconds.to_f / 60).round }

  end

end