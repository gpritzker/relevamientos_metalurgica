require "application_system_test_case"

class ParteDiariosTest < ApplicationSystemTestCase
  setup do
    @parte_diario = parte_diarios(:one)
  end

  test "visiting the index" do
    visit parte_diarios_url
    assert_selector "h1", text: "Parte diarios"
  end

  test "should create parte diario" do
    visit parte_diarios_url
    click_on "Nuevo Parte Diario"

    fill_in "Fecha", with: @parte_diario.fecha
    fill_in "Operario", with: @parte_diario.operario
    fill_in "Sector", with: @parte_diario.sector
    fill_in "Turno", with: @parte_diario.turno
    fill_in "Usuario", with: @parte_diario.usuario_id
    click_on "Crear Parte diario"

    assert_text "Parte diario creado correctamente"
    click_on "Volver"
  end

  test "should update Parte diario" do
    visit parte_diario_url(@parte_diario)
    click_on "Editar este parte diario", match: :first

    fill_in "Fecha", with: @parte_diario.fecha
    fill_in "Operario", with: @parte_diario.operario
    fill_in "Sector", with: @parte_diario.sector
    fill_in "Turno", with: @parte_diario.turno
    fill_in "Usuario", with: @parte_diario.usuario_id
    click_on "Actualizar Parte diario"

    assert_text "Parte diario actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Parte diario" do
    visit parte_diario_url(@parte_diario)
    click_on "Eliminar este parte diario", match: :first

    assert_text "Parte diario eliminado correctamente"
  end
end
