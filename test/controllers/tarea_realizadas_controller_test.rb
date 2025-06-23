require "test_helper"

class TareaRealizadasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tarea_realizada = tarea_realizadas(:one)
  end

  test "should get index" do
    get tarea_realizadas_url
    assert_response :success
  end

  test "should get new" do
    get new_tarea_realizada_url
    assert_response :success
  end

  test "should create tarea_realizada" do
    assert_difference("TareaRealizada.count") do
      post tarea_realizadas_url, params: { tarea_realizada: { cantidad_ejecutada: @tarea_realizada.cantidad_ejecutada, descripcion: @tarea_realizada.descripcion, en_proceso: @tarea_realizada.en_proceso, finalizado: @tarea_realizada.finalizado, hora_fin: @tarea_realizada.hora_fin, hora_inicio: @tarea_realizada.hora_inicio, nro_modulo: @tarea_realizada.nro_modulo, observaciones: @tarea_realizada.observaciones, parte_diario_id: @tarea_realizada.parte_diario_id, tarea_realizada: @tarea_realizada.tarea_realizada } }
    end

    assert_redirected_to tarea_realizada_url(TareaRealizada.last)
  end

  test "should show tarea_realizada" do
    get tarea_realizada_url(@tarea_realizada)
    assert_response :success
  end

  test "should get edit" do
    get edit_tarea_realizada_url(@tarea_realizada)
    assert_response :success
  end

  test "should update tarea_realizada" do
    patch tarea_realizada_url(@tarea_realizada), params: { tarea_realizada: { cantidad_ejecutada: @tarea_realizada.cantidad_ejecutada, descripcion: @tarea_realizada.descripcion, en_proceso: @tarea_realizada.en_proceso, finalizado: @tarea_realizada.finalizado, hora_fin: @tarea_realizada.hora_fin, hora_inicio: @tarea_realizada.hora_inicio, nro_modulo: @tarea_realizada.nro_modulo, observaciones: @tarea_realizada.observaciones, parte_diario_id: @tarea_realizada.parte_diario_id, tarea_realizada: @tarea_realizada.tarea_realizada } }
    assert_redirected_to tarea_realizada_url(@tarea_realizada)
  end

  test "should destroy tarea_realizada" do
    assert_difference("TareaRealizada.count", -1) do
      delete tarea_realizada_url(@tarea_realizada)
    end

    assert_redirected_to tarea_realizadas_url
  end
end
