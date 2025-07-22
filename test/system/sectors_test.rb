require "application_system_test_case"

class SectorsTest < ApplicationSystemTestCase
  setup do
    @sector = sectors(:one)
  end

  test "visiting the index" do
    visit sectors_url
    assert_selector "h1", text: "Sectors"
  end

  test "should create sector" do
    visit sectors_url
    click_on "Nuevo Sector"

    fill_in "Nombre", with: @sector.nombre
    click_on "Crear Sector"

    assert_text "Sector creado correctamente"
    click_on "Volver"
  end

  test "should update Sector" do
    visit sector_url(@sector)
    click_on "Editar este sector", match: :first

    fill_in "Nombre", with: @sector.nombre
    click_on "Actualizar Sector"

    assert_text "Sector actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Sector" do
    visit sector_url(@sector)
    click_on "Eliminar este sector", match: :first

    assert_text "Sector eliminado correctamente"
  end
end
