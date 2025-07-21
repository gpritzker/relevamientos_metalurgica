require "application_system_test_case"

class SubproductosTest < ApplicationSystemTestCase
  setup do
    @subproducto = subproductos(:one)
  end

  test "visiting the index" do
    visit subproductos_url
    assert_selector "h1", text: "Subproductos"
  end

  test "should create subproducto" do
    visit subproductos_url
    click_on "Nuevo Subproducto"

    fill_in "Area", with: @subproducto.sector_id
    fill_in "Nombre", with: @subproducto.nombre
    fill_in "Producto", with: @subproducto.producto_id
    click_on "Crear Subproducto"

    assert_text "Subproducto creado correctamente"
    click_on "Volver"
  end

  test "should update Subproducto" do
    visit subproducto_url(@subproducto)
    click_on "Editar este subproducto", match: :first

    fill_in "Area", with: @subproducto.sector_id
    fill_in "Nombre", with: @subproducto.nombre
    fill_in "Producto", with: @subproducto.producto_id
    click_on "Actualizar Subproducto"

    assert_text "Subproducto actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Subproducto" do
    visit subproducto_url(@subproducto)
    click_on "Eliminar este subproducto", match: :first

    assert_text "Subproducto eliminado correctamente"
  end
end
