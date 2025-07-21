require "application_system_test_case"

class ProyectosTest < ApplicationSystemTestCase
  setup do
    @proyecto = proyectos(:one)
  end

  test "visiting the index" do
    visit proyectos_url
    assert_selector "h1", text: "Proyectos"
  end

  test "should create proyecto" do
    visit proyectos_url
    click_on "➕ Crear Proyecto"

    fill_in "Cliente", with: @proyecto.cliente_id
    fill_in "Documentacion", with: @proyecto.documentacion
    fill_in "Nombre", with: @proyecto.nombre
    fill_in "Plazo contrato", with: @proyecto.plazo_contrato
    fill_in "Tipo obra", with: @proyecto.tipo_obra_id
    fill_in "Ubicacion", with: @proyecto.ubicacion
    click_on "Crear Proyecto"

    assert_text "Proyecto creado correctamente"
    click_on "Volver"
  end

  test "should update Proyecto" do
    visit proyecto_url(@proyecto)
    click_on "Editar este proyecto", match: :first

    fill_in "Cliente", with: @proyecto.cliente_id
    fill_in "Documentacion", with: @proyecto.documentacion
    fill_in "Nombre", with: @proyecto.nombre
    fill_in "Plazo contrato", with: @proyecto.plazo_contrato
    fill_in "Tipo obra", with: @proyecto.tipo_obra_id
    fill_in "Ubicacion", with: @proyecto.ubicacion
    click_on "Actualizar Proyecto"

    assert_text "Proyecto actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Proyecto" do
    visit proyecto_url(@proyecto)
    click_on "Eliminar este proyecto", match: :first

    assert_text "Proyecto eliminado correctamente"
  end
end
