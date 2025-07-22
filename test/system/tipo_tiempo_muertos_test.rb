require "application_system_test_case"

class TipoTiempoMuertosTest < ApplicationSystemTestCase
  setup do
    @tipo_tiempo_muerto = tipo_tiempo_muertos(:one)
  end

  test "visiting the index" do
    visit tipo_tiempo_muertos_url
    assert_selector "h1", text: "Tipo tiempo muertos"
  end

  test "should create tipo tiempo muerto" do
    visit tipo_tiempo_muertos_url
    click_on "Nuevo Tipo"

    fill_in "Nombre", with: @tipo_tiempo_muerto.nombre
    click_on "Crear Tipo tiempo muerto"

    assert_text "Tipo tiempo muerto creado correctamente"
    click_on "Volver"
  end

  test "should update Tipo tiempo muerto" do
    visit tipo_tiempo_muerto_url(@tipo_tiempo_muerto)
    click_on "Editar este tipo tiempo muerto", match: :first

    fill_in "Nombre", with: @tipo_tiempo_muerto.nombre
    click_on "Actualizar Tipo tiempo muerto"

    assert_text "Tipo tiempo muerto actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Tipo tiempo muerto" do
    visit tipo_tiempo_muerto_url(@tipo_tiempo_muerto)
    click_on "Eliminar este tipo tiempo muerto", match: :first

    assert_text "Tipo tiempo muerto eliminado correctamente"
  end
end
