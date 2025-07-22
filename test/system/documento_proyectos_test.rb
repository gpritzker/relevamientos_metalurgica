require "application_system_test_case"

class DocumentoProyectosTest < ApplicationSystemTestCase
  setup do
    @documento_proyecto = documento_proyectos(:one)
  end

  test "visiting the index" do
    visit documento_proyectos_url
    assert_selector "h1", text: "Documento proyectos"
  end

  test "should create documento proyecto" do
    visit documento_proyectos_url
    click_on "➕ Nuevo Documento"

    fill_in "Nombre", with: @documento_proyecto.nombre
    fill_in "Observaciones", with: @documento_proyecto.observaciones
    check "Presente" if @documento_proyecto.presente
    fill_in "Proyecto", with: @documento_proyecto.proyecto_id
    click_on "Crear Documento proyecto"

    assert_text "Documento proyecto creado correctamente"
    click_on "Volver"
  end

  test "should update Documento proyecto" do
    visit documento_proyecto_url(@documento_proyecto)
    click_on "Editar este documento proyecto", match: :first

    fill_in "Nombre", with: @documento_proyecto.nombre
    fill_in "Observaciones", with: @documento_proyecto.observaciones
    check "Presente" if @documento_proyecto.presente
    fill_in "Proyecto", with: @documento_proyecto.proyecto_id
    click_on "Actualizar Documento proyecto"

    assert_text "Documento proyecto actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Documento proyecto" do
    visit documento_proyecto_url(@documento_proyecto)
    click_on "Eliminar este documento proyecto", match: :first

    assert_text "Documento proyecto eliminado correctamente"
  end
end
