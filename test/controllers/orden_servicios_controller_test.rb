require "test_helper"

class OrdenServiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_servicio = orden_servicios(:one)
  end

  test "should get index" do
    get orden_servicios_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_servicio_url
    assert_response :success
  end

  test "should create orden_servicio" do
    assert_difference("OrdenServicio.count") do
      post orden_servicios_url, params: { orden_servicio: { descripcion: @orden_servicio.descripcion, estado: @orden_servicio.estado, fecha_entrega: @orden_servicio.fecha_entrega, fecha_inicio: @orden_servicio.fecha_inicio, observaciones: @orden_servicio.observaciones, proyecto_id: @orden_servicio.proyecto_id, tipo_orden_servicio_id: @orden_servicio.tipo_orden_servicio_id } }
    end

    assert_redirected_to orden_servicio_url(OrdenServicio.last)
  end

  test "should show orden_servicio" do
    get orden_servicio_url(@orden_servicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_servicio_url(@orden_servicio)
    assert_response :success
  end

  test "should update orden_servicio" do
    patch orden_servicio_url(@orden_servicio), params: { orden_servicio: { descripcion: @orden_servicio.descripcion, estado: @orden_servicio.estado, fecha_entrega: @orden_servicio.fecha_entrega, fecha_inicio: @orden_servicio.fecha_inicio, observaciones: @orden_servicio.observaciones, proyecto_id: @orden_servicio.proyecto_id, tipo_orden_servicio_id: @orden_servicio.tipo_orden_servicio_id } }
    assert_redirected_to orden_servicio_url(@orden_servicio)
  end

  test "should destroy orden_servicio" do
    assert_difference("OrdenServicio.count", -1) do
      delete orden_servicio_url(@orden_servicio)
    end

    assert_redirected_to orden_servicios_url
  end
end
