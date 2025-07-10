require "test_helper"

class TipoOrdenServiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_orden_servicio = tipo_orden_servicios(:one)
  end

  test "should get index" do
    get tipo_orden_servicios_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_orden_servicio_url
    assert_response :success
  end

  test "should create tipo_orden_servicio" do
    assert_difference("TipoOrdenServicio.count") do
      post tipo_orden_servicios_url, params: { tipo_orden_servicio: { nombre: @tipo_orden_servicio.nombre } }
    end

    assert_redirected_to tipo_orden_servicio_url(TipoOrdenServicio.last)
  end

  test "should show tipo_orden_servicio" do
    get tipo_orden_servicio_url(@tipo_orden_servicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_orden_servicio_url(@tipo_orden_servicio)
    assert_response :success
  end

  test "should update tipo_orden_servicio" do
    patch tipo_orden_servicio_url(@tipo_orden_servicio), params: { tipo_orden_servicio: { nombre: @tipo_orden_servicio.nombre } }
    assert_redirected_to tipo_orden_servicio_url(@tipo_orden_servicio)
  end

  test "should destroy tipo_orden_servicio" do
    assert_difference("TipoOrdenServicio.count", -1) do
      delete tipo_orden_servicio_url(@tipo_orden_servicio)
    end

    assert_redirected_to tipo_orden_servicios_url
  end
end
