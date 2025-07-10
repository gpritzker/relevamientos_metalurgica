require "test_helper"

class ParteProduccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parte_produccion = parte_produccions(:one)
  end

  test "should get index" do
    get parte_produccions_url
    assert_response :success
  end

  test "should get new" do
    get new_parte_produccion_url
    assert_response :success
  end

  test "should create parte_produccion" do
    assert_difference("ParteProduccion.count") do
      post parte_produccions_url, params: { parte_produccion: { fecha: @parte_produccion.fecha, jornada_laboral: @parte_produccion.jornada_laboral, observaciones: @parte_produccion.observaciones, operario_id: @parte_produccion.operario_id, orden_servicio_id: @parte_produccion.orden_servicio_id } }
    end

    assert_redirected_to parte_produccion_url(ParteProduccion.last)
  end

  test "should show parte_produccion" do
    get parte_produccion_url(@parte_produccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_parte_produccion_url(@parte_produccion)
    assert_response :success
  end

  test "should update parte_produccion" do
    patch parte_produccion_url(@parte_produccion), params: { parte_produccion: { fecha: @parte_produccion.fecha, jornada_laboral: @parte_produccion.jornada_laboral, observaciones: @parte_produccion.observaciones, operario_id: @parte_produccion.operario_id, orden_servicio_id: @parte_produccion.orden_servicio_id } }
    assert_redirected_to parte_produccion_url(@parte_produccion)
  end

  test "should destroy parte_produccion" do
    assert_difference("ParteProduccion.count", -1) do
      delete parte_produccion_url(@parte_produccion)
    end

    assert_redirected_to parte_produccions_url
  end
end
