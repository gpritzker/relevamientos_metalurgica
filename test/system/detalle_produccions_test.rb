require "application_system_test_case"

class DetalleProduccionsTest < ApplicationSystemTestCase
  setup do
    @detalle_produccion = detalle_produccions(:one)
  end

  test "visiting the index" do
    visit detalle_produccions_url
    assert_selector "h1", text: "Detalle produccions"
  end

  test "should create detalle produccion" do
    visit detalle_produccions_url
    click_on "New detalle produccion"

    fill_in "Aceptados", with: @detalle_produccion.aceptados
    fill_in "Cantidad a ejecutar", with: @detalle_produccion.cantidad_a_ejecutar
    fill_in "Cantidad ejecutada", with: @detalle_produccion.cantidad_ejecutada
    fill_in "Componente", with: @detalle_produccion.componente
    fill_in "Descripcion", with: @detalle_produccion.descripcion
    fill_in "Hora fin", with: @detalle_produccion.hora_fin
    fill_in "Hora inicio", with: @detalle_produccion.hora_inicio
    fill_in "Observaciones", with: @detalle_produccion.observaciones
    fill_in "Parte produccion", with: @detalle_produccion.parte_produccion_id
    fill_in "Rechazados", with: @detalle_produccion.rechazados
    fill_in "Tiempo empleado", with: @detalle_produccion.tiempo_empleado
    click_on "Create Detalle produccion"

    assert_text "Detalle produccion was successfully created"
    click_on "Back"
  end

  test "should update Detalle produccion" do
    visit detalle_produccion_url(@detalle_produccion)
    click_on "Edit this detalle produccion", match: :first

    fill_in "Aceptados", with: @detalle_produccion.aceptados
    fill_in "Cantidad a ejecutar", with: @detalle_produccion.cantidad_a_ejecutar
    fill_in "Cantidad ejecutada", with: @detalle_produccion.cantidad_ejecutada
    fill_in "Componente", with: @detalle_produccion.componente
    fill_in "Descripcion", with: @detalle_produccion.descripcion
    fill_in "Hora fin", with: @detalle_produccion.hora_fin
    fill_in "Hora inicio", with: @detalle_produccion.hora_inicio
    fill_in "Observaciones", with: @detalle_produccion.observaciones
    fill_in "Parte produccion", with: @detalle_produccion.parte_produccion_id
    fill_in "Rechazados", with: @detalle_produccion.rechazados
    fill_in "Tiempo empleado", with: @detalle_produccion.tiempo_empleado
    click_on "Update Detalle produccion"

    assert_text "Detalle produccion was successfully updated"
    click_on "Back"
  end

  test "should destroy Detalle produccion" do
    visit detalle_produccion_url(@detalle_produccion)
    click_on "Destroy this detalle produccion", match: :first

    assert_text "Detalle produccion was successfully destroyed"
  end
end
