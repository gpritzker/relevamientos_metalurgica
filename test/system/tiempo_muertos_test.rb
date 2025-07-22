require "application_system_test_case"

class TiempoMuertosTest < ApplicationSystemTestCase
  setup do
    @tiempo_muerto = tiempo_muertos(:one)
  end

  test "visiting the index" do
    visit tiempo_muertos_url
    assert_selector "h1", text: "Tiempo muertos"
  end

  test "should create tiempo muerto" do
    visit tiempo_muertos_url
    click_on "Nuevo Tiempo Muerto"

    fill_in "Hora fin", with: @tiempo_muerto.hora_fin
    fill_in "Hora inicio", with: @tiempo_muerto.hora_inicio
    fill_in "Observaciones", with: @tiempo_muerto.observaciones
    fill_in "Parte diario", with: @tiempo_muerto.parte_diario_id
    fill_in "Tipo tiempo muerto", with: @tiempo_muerto.tipo_tiempo_muerto_id
    click_on "Crear Tiempo muerto"

    assert_text "Tiempo muerto creado correctamente"
    click_on "Volver"
  end

  test "should update Tiempo muerto" do
    visit tiempo_muerto_url(@tiempo_muerto)
    click_on "Editar este tiempo muerto", match: :first

    fill_in "Hora fin", with: @tiempo_muerto.hora_fin
    fill_in "Hora inicio", with: @tiempo_muerto.hora_inicio
    fill_in "Observaciones", with: @tiempo_muerto.observaciones
    fill_in "Parte diario", with: @tiempo_muerto.parte_diario_id
    fill_in "Tipo tiempo muerto", with: @tiempo_muerto.tipo_tiempo_muerto_id
    click_on "Actualizar Tiempo muerto"

    assert_text "Tiempo muerto actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Tiempo muerto" do
    visit tiempo_muerto_url(@tiempo_muerto)
    click_on "Eliminar este tiempo muerto", match: :first

    assert_text "Tiempo muerto eliminado correctamente"
  end
end
