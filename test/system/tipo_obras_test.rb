require "application_system_test_case"

class TipoObrasTest < ApplicationSystemTestCase
  setup do
    @tipo_obra = tipo_obras(:one)
  end

  test "visiting the index" do
    visit tipo_obras_url
    assert_selector "h1", text: "Tipo obras"
  end

  test "should create tipo obra" do
    visit tipo_obras_url
    click_on "Nuevo Tipo de Obra"

    fill_in "Nombre", with: @tipo_obra.nombre
    click_on "Crear Tipo obra"

    assert_text "Tipo obra creado correctamente"
    click_on "Volver"
  end

  test "should update Tipo obra" do
    visit tipo_obra_url(@tipo_obra)
    click_on "Editar este tipo obra", match: :first

    fill_in "Nombre", with: @tipo_obra.nombre
    click_on "Actualizar Tipo obra"

    assert_text "Tipo obra actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Tipo obra" do
    visit tipo_obra_url(@tipo_obra)
    click_on "Eliminar este tipo obra", match: :first

    assert_text "Tipo obra eliminado correctamente"
  end
end
