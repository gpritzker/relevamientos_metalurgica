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
    click_on "New subproducto"

    fill_in "Area", with: @subproducto.sector_id
    fill_in "Nombre", with: @subproducto.nombre
    fill_in "Producto", with: @subproducto.producto_id
    click_on "Create Subproducto"

    assert_text "Subproducto was successfully created"
    click_on "Back"
  end

  test "should update Subproducto" do
    visit subproducto_url(@subproducto)
    click_on "Edit this subproducto", match: :first

    fill_in "Area", with: @subproducto.sector_id
    fill_in "Nombre", with: @subproducto.nombre
    fill_in "Producto", with: @subproducto.producto_id
    click_on "Update Subproducto"

    assert_text "Subproducto was successfully updated"
    click_on "Back"
  end

  test "should destroy Subproducto" do
    visit subproducto_url(@subproducto)
    click_on "Destroy this subproducto", match: :first

    assert_text "Subproducto was successfully destroyed"
  end
end
