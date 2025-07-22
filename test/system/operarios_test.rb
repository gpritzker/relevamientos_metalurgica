require "application_system_test_case"

class OperariosTest < ApplicationSystemTestCase
  setup do
    @operario = operarios(:one)
  end

  test "visiting the index" do
    visit operarios_url
    assert_selector "h1", text: "Operarios"
  end

  test "should create operario" do
    visit operarios_url
    click_on "Nuevo Operario"

    check "Activo" if @operario.activo
    fill_in "Legajo", with: @operario.legajo
    fill_in "Nombre", with: @operario.nombre
    fill_in "Sector", with: @operario.sector
    click_on "Crear Operario"

    assert_text "Operario creado correctamente"
    click_on "Volver"
  end

  test "should update Operario" do
    visit operario_url(@operario)
    click_on "Editar este operario", match: :first

    check "Activo" if @operario.activo
    fill_in "Legajo", with: @operario.legajo
    fill_in "Nombre", with: @operario.nombre
    fill_in "Sector", with: @operario.sector
    click_on "Actualizar Operario"

    assert_text "Operario actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Operario" do
    visit operario_url(@operario)
    click_on "Eliminar este operario", match: :first

    assert_text "Operario eliminado correctamente"
  end
end
