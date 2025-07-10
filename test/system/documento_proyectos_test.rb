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
    click_on "New documento proyecto"

    fill_in "Nombre", with: @documento_proyecto.nombre
    fill_in "Observaciones", with: @documento_proyecto.observaciones
    check "Presente" if @documento_proyecto.presente
    fill_in "Proyecto", with: @documento_proyecto.proyecto_id
    click_on "Create Documento proyecto"

    assert_text "Documento proyecto was successfully created"
    click_on "Back"
  end

  test "should update Documento proyecto" do
    visit documento_proyecto_url(@documento_proyecto)
    click_on "Edit this documento proyecto", match: :first

    fill_in "Nombre", with: @documento_proyecto.nombre
    fill_in "Observaciones", with: @documento_proyecto.observaciones
    check "Presente" if @documento_proyecto.presente
    fill_in "Proyecto", with: @documento_proyecto.proyecto_id
    click_on "Update Documento proyecto"

    assert_text "Documento proyecto was successfully updated"
    click_on "Back"
  end

  test "should destroy Documento proyecto" do
    visit documento_proyecto_url(@documento_proyecto)
    click_on "Destroy this documento proyecto", match: :first

    assert_text "Documento proyecto was successfully destroyed"
  end
end
