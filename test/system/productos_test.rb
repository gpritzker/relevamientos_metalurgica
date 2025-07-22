require "application_system_test_case"

class ProductosTest < ApplicationSystemTestCase
  setup do
    @producto = productos(:one)
  end

  test "visiting the index" do
    visit productos_url
    assert_selector "h1", text: "Productos"
  end

  test "should create producto" do
    visit productos_url
    click_on "Nuevo Producto"

    fill_in "Descripcion", with: @producto.descripcion
    fill_in "Nombre", with: @producto.nombre
    click_on "Crear Producto"

    assert_text "Producto creado correctamente"
    click_on "Volver"
  end

  test "should update Producto" do
    visit producto_url(@producto)
    click_on "Editar este producto", match: :first

    fill_in "Descripcion", with: @producto.descripcion
    fill_in "Nombre", with: @producto.nombre
    click_on "Actualizar Producto"

    assert_text "Producto actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Producto" do
    visit producto_url(@producto)
    click_on "Eliminar este producto", match: :first

    assert_text "Producto eliminado correctamente"
  end
end
