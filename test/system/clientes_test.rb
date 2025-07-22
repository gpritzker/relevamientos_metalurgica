require "application_system_test_case"

class ClientesTest < ApplicationSystemTestCase
  setup do
    @cliente = clientes(:one)
  end

  test "visiting the index" do
    visit clientes_url
    assert_selector "h1", text: "Clientes"
  end

  test "should create cliente" do
    visit clientes_url
    click_on "➕ Nuevo Cliente"

    fill_in "Cuit", with: @cliente.cuit
    fill_in "Direccion", with: @cliente.direccion
    fill_in "Email", with: @cliente.email
    fill_in "Nombre", with: @cliente.nombre
    fill_in "Observaciones", with: @cliente.observaciones
    fill_in "Telefono", with: @cliente.telefono
    click_on "Crear Cliente"

    assert_text "Cliente creado correctamente"
    click_on "Volver"
  end

  test "should update Cliente" do
    visit cliente_url(@cliente)
    click_on "Editar este cliente", match: :first

    fill_in "Cuit", with: @cliente.cuit
    fill_in "Direccion", with: @cliente.direccion
    fill_in "Email", with: @cliente.email
    fill_in "Nombre", with: @cliente.nombre
    fill_in "Observaciones", with: @cliente.observaciones
    fill_in "Telefono", with: @cliente.telefono
    click_on "Actualizar Cliente"

    assert_text "Cliente actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Cliente" do
    visit cliente_url(@cliente)
    click_on "Eliminar este cliente", match: :first

    assert_text "Cliente eliminado correctamente"
  end
end
