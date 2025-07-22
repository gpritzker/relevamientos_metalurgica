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
    click_on "Nuevo Tipo"

    fill_in "Nombre", with: @tipo_orden_servicio.nombre
    click_on "Crear Tipo orden servicio"

    assert_text "Tipo orden servicio creado correctamente"
    click_on "Volver"
  end

  test "should update Tipo orden servicio" do
    visit tipo_orden_servicio_url(@tipo_orden_servicio)
    click_on "Editar este tipo orden servicio", match: :first

    fill_in "Nombre", with: @tipo_orden_servicio.nombre
    click_on "Actualizar Tipo orden servicio"

    assert_text "Tipo orden servicio actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Tipo orden servicio" do
    visit tipo_orden_servicio_url(@tipo_orden_servicio)
    click_on "Eliminar este tipo orden servicio", match: :first

    assert_text "Tipo orden servicio eliminado correctamente"
  end
end
