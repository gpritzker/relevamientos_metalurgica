require "test_helper"

class TipoTiempoMuertosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_tiempo_muerto = tipo_tiempo_muertos(:one)
  end

  test "should get index" do
    get tipo_tiempo_muertos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_tiempo_muerto_url
    assert_response :success
  end

  test "should create tipo_tiempo_muerto" do
    assert_difference("TipoTiempoMuerto.count") do
      post tipo_tiempo_muertos_url, params: { tipo_tiempo_muerto: { nombre: @tipo_tiempo_muerto.nombre } }
    end

    assert_redirected_to tipo_tiempo_muerto_url(TipoTiempoMuerto.last)
  end

  test "should show tipo_tiempo_muerto" do
    get tipo_tiempo_muerto_url(@tipo_tiempo_muerto)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_tiempo_muerto_url(@tipo_tiempo_muerto)
    assert_response :success
  end

  test "should update tipo_tiempo_muerto" do
    patch tipo_tiempo_muerto_url(@tipo_tiempo_muerto), params: { tipo_tiempo_muerto: { nombre: @tipo_tiempo_muerto.nombre } }
    assert_redirected_to tipo_tiempo_muerto_url(@tipo_tiempo_muerto)
  end

  test "should destroy tipo_tiempo_muerto" do
    assert_difference("TipoTiempoMuerto.count", -1) do
      delete tipo_tiempo_muerto_url(@tipo_tiempo_muerto)
    end

    assert_redirected_to tipo_tiempo_muertos_url
  end
end
