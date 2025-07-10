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
    click_on "New no conformidad"

    fill_in "Cantidad afectada", with: @no_conformidad.cantidad_afectada
    fill_in "Detalle produccion", with: @no_conformidad.detalle_produccion_id
    fill_in "Motivo", with: @no_conformidad.motivo
    fill_in "Observaciones", with: @no_conformidad.observaciones
    click_on "Create No conformidad"

    assert_text "No conformidad was successfully created"
    click_on "Back"
  end

  test "should update No conformidad" do
    visit no_conformidad_url(@no_conformidad)
    click_on "Edit this no conformidad", match: :first

    fill_in "Cantidad afectada", with: @no_conformidad.cantidad_afectada
    fill_in "Detalle produccion", with: @no_conformidad.detalle_produccion_id
    fill_in "Motivo", with: @no_conformidad.motivo
    fill_in "Observaciones", with: @no_conformidad.observaciones
    click_on "Update No conformidad"

    assert_text "No conformidad was successfully updated"
    click_on "Back"
  end

  test "should destroy No conformidad" do
    visit no_conformidad_url(@no_conformidad)
    click_on "Destroy this no conformidad", match: :first

    assert_text "No conformidad was successfully destroyed"
  end
end
