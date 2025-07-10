require "test_helper"

class DetalleProduccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_produccion = detalle_produccions(:one)
  end

  test "should get index" do
    get detalle_produccions_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_produccion_url
    assert_response :success
  end

  test "should create detalle_produccion" do
    assert_difference("DetalleProduccion.count") do
      post detalle_produccions_url, params: { detalle_produccion: { aceptados: @detalle_produccion.aceptados, cantidad_a_ejecutar: @detalle_produccion.cantidad_a_ejecutar, cantidad_ejecutada: @detalle_produccion.cantidad_ejecutada, componente: @detalle_produccion.componente, descripcion: @detalle_produccion.descripcion, hora_fin: @detalle_produccion.hora_fin, hora_inicio: @detalle_produccion.hora_inicio, observaciones: @detalle_produccion.observaciones, parte_produccion_id: @detalle_produccion.parte_produccion_id, rechazados: @detalle_produccion.rechazados, tiempo_empleado: @detalle_produccion.tiempo_empleado } }
    end

    assert_redirected_to detalle_produccion_url(DetalleProduccion.last)
  end

  test "should show detalle_produccion" do
    get detalle_produccion_url(@detalle_produccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_produccion_url(@detalle_produccion)
    assert_response :success
  end

  test "should update detalle_produccion" do
    patch detalle_produccion_url(@detalle_produccion), params: { detalle_produccion: { aceptados: @detalle_produccion.aceptados, cantidad_a_ejecutar: @detalle_produccion.cantidad_a_ejecutar, cantidad_ejecutada: @detalle_produccion.cantidad_ejecutada, componente: @detalle_produccion.componente, descripcion: @detalle_produccion.descripcion, hora_fin: @detalle_produccion.hora_fin, hora_inicio: @detalle_produccion.hora_inicio, observaciones: @detalle_produccion.observaciones, parte_produccion_id: @detalle_produccion.parte_produccion_id, rechazados: @detalle_produccion.rechazados, tiempo_empleado: @detalle_produccion.tiempo_empleado } }
    assert_redirected_to detalle_produccion_url(@detalle_produccion)
  end

  test "should destroy detalle_produccion" do
    assert_difference("DetalleProduccion.count", -1) do
      delete detalle_produccion_url(@detalle_produccion)
    end

    assert_redirected_to detalle_produccions_url
  end
end
