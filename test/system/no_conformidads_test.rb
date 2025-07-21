require "application_system_test_case"

class NoConformidadsTest < ApplicationSystemTestCase
  setup do
    @no_conformidad = no_conformidads(:one)
  end

  test "visiting the index" do
    visit no_conformidads_url
    assert_selector "h1", text: "No conformidads"
  end

  test "should create no conformidad" do
    visit no_conformidads_url
    click_on "Nueva No Conformidad"

    fill_in "Cantidad afectada", with: @no_conformidad.cantidad_afectada
    fill_in "Detalle produccion", with: @no_conformidad.detalle_produccion_id
    fill_in "Motivo", with: @no_conformidad.motivo
    fill_in "Observaciones", with: @no_conformidad.observaciones
    click_on "Crear No conformidad"

    assert_text "No conformidad creado correctamente"
    click_on "Volver"
  end

  test "should update No conformidad" do
    visit no_conformidad_url(@no_conformidad)
    click_on "Editar este no conformidad", match: :first

    fill_in "Cantidad afectada", with: @no_conformidad.cantidad_afectada
    fill_in "Detalle produccion", with: @no_conformidad.detalle_produccion_id
    fill_in "Motivo", with: @no_conformidad.motivo
    fill_in "Observaciones", with: @no_conformidad.observaciones
    click_on "Actualizar No conformidad"

    assert_text "No conformidad actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy No conformidad" do
    visit no_conformidad_url(@no_conformidad)
    click_on "Eliminar este no conformidad", match: :first

    assert_text "No conformidad eliminado correctamente"
  end
end
