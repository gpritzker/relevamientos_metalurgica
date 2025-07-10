require "application_system_test_case"

class TipoOrdenServiciosTest < ApplicationSystemTestCase
  setup do
    @tipo_orden_servicio = tipo_orden_servicios(:one)
  end

  test "visiting the index" do
    visit tipo_orden_servicios_url
    assert_selector "h1", text: "Tipo orden servicios"
  end

  test "should create tipo orden servicio" do
    visit tipo_orden_servicios_url
    click_on "New tipo orden servicio"

    fill_in "Nombre", with: @tipo_orden_servicio.nombre
    click_on "Create Tipo orden servicio"

    assert_text "Tipo orden servicio was successfully created"
    click_on "Back"
  end

  test "should update Tipo orden servicio" do
    visit tipo_orden_servicio_url(@tipo_orden_servicio)
    click_on "Edit this tipo orden servicio", match: :first

    fill_in "Nombre", with: @tipo_orden_servicio.nombre
    click_on "Update Tipo orden servicio"

    assert_text "Tipo orden servicio was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo orden servicio" do
    visit tipo_orden_servicio_url(@tipo_orden_servicio)
    click_on "Destroy this tipo orden servicio", match: :first

    assert_text "Tipo orden servicio was successfully destroyed"
  end
end
