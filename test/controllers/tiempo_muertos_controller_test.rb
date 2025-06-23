require "test_helper"

class TiempoMuertosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tiempo_muerto = tiempo_muertos(:one)
  end

  test "should get index" do
    get tiempo_muertos_url
    assert_response :success
  end

  test "should get new" do
    get new_tiempo_muerto_url
    assert_response :success
  end

  test "should create tiempo_muerto" do
    assert_difference("TiempoMuerto.count") do
      post tiempo_muertos_url, params: { tiempo_muerto: { hora_fin: @tiempo_muerto.hora_fin, hora_inicio: @tiempo_muerto.hora_inicio, observaciones: @tiempo_muerto.observaciones, parte_diario_id: @tiempo_muerto.parte_diario_id, tipo_tiempo_muerto_id: @tiempo_muerto.tipo_tiempo_muerto_id } }
    end

    assert_redirected_to tiempo_muerto_url(TiempoMuerto.last)
  end

  test "should show tiempo_muerto" do
    get tiempo_muerto_url(@tiempo_muerto)
    assert_response :success
  end

  test "should get edit" do
    get edit_tiempo_muerto_url(@tiempo_muerto)
    assert_response :success
  end

  test "should update tiempo_muerto" do
    patch tiempo_muerto_url(@tiempo_muerto), params: { tiempo_muerto: { hora_fin: @tiempo_muerto.hora_fin, hora_inicio: @tiempo_muerto.hora_inicio, observaciones: @tiempo_muerto.observaciones, parte_diario_id: @tiempo_muerto.parte_diario_id, tipo_tiempo_muerto_id: @tiempo_muerto.tipo_tiempo_muerto_id } }
    assert_redirected_to tiempo_muerto_url(@tiempo_muerto)
  end

  test "should destroy tiempo_muerto" do
    assert_difference("TiempoMuerto.count", -1) do
      delete tiempo_muerto_url(@tiempo_muerto)
    end

    assert_redirected_to tiempo_muertos_url
  end
end
