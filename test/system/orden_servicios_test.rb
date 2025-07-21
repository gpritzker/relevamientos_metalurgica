require "application_system_test_case"

class OrdenServiciosTest < ApplicationSystemTestCase
  setup do
    @orden_servicio = orden_servicios(:one)
  end

  test "visiting the index" do
    visit orden_servicios_url
    assert_selector "h1", text: "Orden servicios"
  end

  test "should create orden servicio" do
    visit orden_servicios_url
    click_on "➕ Nueva Orden de Servicio"

    fill_in "Descripcion", with: @orden_servicio.descripcion
    fill_in "Estado", with: @orden_servicio.estado
    fill_in "Fecha entrega", with: @orden_servicio.fecha_entrega
    fill_in "Fecha inicio", with: @orden_servicio.fecha_inicio
    fill_in "Observaciones", with: @orden_servicio.observaciones
    fill_in "Proyecto", with: @orden_servicio.proyecto_id
    fill_in "Tipo orden servicio", with: @orden_servicio.tipo_orden_servicio_id
    click_on "Crear Orden servicio"

    assert_text "Orden servicio creado correctamente"
    click_on "Volver"
  end

  test "should update Orden servicio" do
    visit orden_servicio_url(@orden_servicio)
    click_on "Editar este orden servicio", match: :first

    fill_in "Descripcion", with: @orden_servicio.descripcion
    fill_in "Estado", with: @orden_servicio.estado
    fill_in "Fecha entrega", with: @orden_servicio.fecha_entrega
    fill_in "Fecha inicio", with: @orden_servicio.fecha_inicio
    fill_in "Observaciones", with: @orden_servicio.observaciones
    fill_in "Proyecto", with: @orden_servicio.proyecto_id
    fill_in "Tipo orden servicio", with: @orden_servicio.tipo_orden_servicio_id
    click_on "Actualizar Orden servicio"

    assert_text "Orden servicio actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Orden servicio" do
    visit orden_servicio_url(@orden_servicio)
    click_on "Eliminar este orden servicio", match: :first

    assert_text "Orden servicio eliminado correctamente"
  end
end
