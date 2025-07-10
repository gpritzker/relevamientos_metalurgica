require "test_helper"

class DocumentoProyectosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @documento_proyecto = documento_proyectos(:one)
  end

  test "should get index" do
    get documento_proyectos_url
    assert_response :success
  end

  test "should get new" do
    get new_documento_proyecto_url
    assert_response :success
  end

  test "should create documento_proyecto" do
    assert_difference("DocumentoProyecto.count") do
      post documento_proyectos_url, params: { documento_proyecto: { nombre: @documento_proyecto.nombre, observaciones: @documento_proyecto.observaciones, presente: @documento_proyecto.presente, proyecto_id: @documento_proyecto.proyecto_id } }
    end

    assert_redirected_to documento_proyecto_url(DocumentoProyecto.last)
  end

  test "should show documento_proyecto" do
    get documento_proyecto_url(@documento_proyecto)
    assert_response :success
  end

  test "should get edit" do
    get edit_documento_proyecto_url(@documento_proyecto)
    assert_response :success
  end

  test "should update documento_proyecto" do
    patch documento_proyecto_url(@documento_proyecto), params: { documento_proyecto: { nombre: @documento_proyecto.nombre, observaciones: @documento_proyecto.observaciones, presente: @documento_proyecto.presente, proyecto_id: @documento_proyecto.proyecto_id } }
    assert_redirected_to documento_proyecto_url(@documento_proyecto)
  end

  test "should destroy documento_proyecto" do
    assert_difference("DocumentoProyecto.count", -1) do
      delete documento_proyecto_url(@documento_proyecto)
    end

    assert_redirected_to documento_proyectos_url
  end
end
