require "application_system_test_case"

class ParteProduccionsTest < ApplicationSystemTestCase
  setup do
    @parte_produccion = parte_produccions(:one)
  end

  test "visiting the index" do
    visit parte_produccions_url
    assert_selector "h1", text: "Parte produccions"
  end

  test "should create parte produccion" do
    visit parte_produccions_url
    click_on "➕ Nuevo Parte de Producción"

    fill_in "Fecha", with: @parte_produccion.fecha
    fill_in "Jornada laboral", with: @parte_produccion.jornada_laboral
    fill_in "Observaciones", with: @parte_produccion.observaciones
    click_on "Crear Parte produccion"

    assert_text "Parte produccion creado correctamente"
    click_on "Volver"
  end

  test "should update Parte produccion" do
    visit parte_produccion_url(@parte_produccion)
    click_on "Editar este parte produccion", match: :first

    fill_in "Fecha", with: @parte_produccion.fecha
    fill_in "Jornada laboral", with: @parte_produccion.jornada_laboral
    fill_in "Observaciones", with: @parte_produccion.observaciones
    fill_in "Operario", with: @parte_produccion.operario_id
    fill_in "Orden servicio", with: @parte_produccion.orden_servicio_id
    click_on "Actualizar Parte produccion"

    assert_text "Parte produccion actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Parte produccion" do
    visit parte_produccion_url(@parte_produccion)
    click_on "Eliminar este parte produccion", match: :first

    assert_text "Parte produccion eliminado correctamente"
  end
end
