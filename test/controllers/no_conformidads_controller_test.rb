require "test_helper"

class NoConformidadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @no_conformidad = no_conformidads(:one)
  end

  test "should get index" do
    get no_conformidads_url
    assert_response :success
  end

  test "should get new" do
    get new_no_conformidad_url
    assert_response :success
  end

  test "should create no_conformidad" do
    assert_difference("NoConformidad.count") do
      post no_conformidads_url, params: { no_conformidad: { cantidad_afectada: @no_conformidad.cantidad_afectada, detalle_produccion_id: @no_conformidad.detalle_produccion_id, motivo: @no_conformidad.motivo, observaciones: @no_conformidad.observaciones } }
    end

    assert_redirected_to no_conformidad_url(NoConformidad.last)
  end

  test "should show no_conformidad" do
    get no_conformidad_url(@no_conformidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_no_conformidad_url(@no_conformidad)
    assert_response :success
  end

  test "should update no_conformidad" do
    patch no_conformidad_url(@no_conformidad), params: { no_conformidad: { cantidad_afectada: @no_conformidad.cantidad_afectada, detalle_produccion_id: @no_conformidad.detalle_produccion_id, motivo: @no_conformidad.motivo, observaciones: @no_conformidad.observaciones } }
    assert_redirected_to no_conformidad_url(@no_conformidad)
  end

  test "should destroy no_conformidad" do
    assert_difference("NoConformidad.count", -1) do
      delete no_conformidad_url(@no_conformidad)
    end

    assert_redirected_to no_conformidads_url
  end
end
