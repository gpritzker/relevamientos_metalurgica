require "application_system_test_case"

class CategoriaTest < ApplicationSystemTestCase
  setup do
    @categorium = categoria(:one)
  end

  test "visiting the index" do
    visit categoria_url
    assert_selector "h1", text: "Categoria"
  end

  test "should create categorium" do
    visit categoria_url
    click_on "Nueva Categoría"

    fill_in "Descripcion", with: @categorium.descripcion
    fill_in "Nombre", with: @categorium.nombre
    click_on "Crear Categorium"

    assert_text "Categorium creado correctamente"
    click_on "Volver"
  end

  test "should update Categorium" do
    visit categorium_url(@categorium)
    click_on "Editar este categorium", match: :first

    fill_in "Descripcion", with: @categorium.descripcion
    fill_in "Nombre", with: @categorium.nombre
    click_on "Actualizar Categorium"

    assert_text "Categorium actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Categorium" do
    visit categorium_url(@categorium)
    click_on "Eliminar este categorium", match: :first

    assert_text "Categorium eliminado correctamente"
  end
end
