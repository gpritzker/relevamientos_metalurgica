require "application_system_test_case"

class MaterialsTest < ApplicationSystemTestCase
  setup do
    @material = materials(:one)
  end

  test "visiting the index" do
    visit materials_url
    assert_selector "h1", text: "Materials"
  end

  test "should create material" do
    visit materials_url
    click_on "➕ Nuevo Material"

    fill_in "Nombre", with: @material.nombre
    fill_in "Observaciones", with: @material.observaciones
    fill_in "Stock actual", with: @material.stock_actual
    fill_in "Stock minimo", with: @material.stock_minimo
    fill_in "Unidad", with: @material.unidad
    click_on "Crear Material"

    assert_text "Material creado correctamente"
    click_on "Volver"
  end

  test "should update Material" do
    visit material_url(@material)
    click_on "Editar este material", match: :first

    fill_in "Nombre", with: @material.nombre
    fill_in "Observaciones", with: @material.observaciones
    fill_in "Stock actual", with: @material.stock_actual
    fill_in "Stock minimo", with: @material.stock_minimo
    fill_in "Unidad", with: @material.unidad
    click_on "Actualizar Material"

    assert_text "Material actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Material" do
    visit material_url(@material)
    click_on "Eliminar este material", match: :first

    assert_text "Material eliminado correctamente"
  end
end
