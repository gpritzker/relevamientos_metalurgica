require "test_helper"

class TipoObrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_obra = tipo_obras(:one)
  end

  test "should get index" do
    get tipo_obras_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_obra_url
    assert_response :success
  end

  test "should create tipo_obra" do
    assert_difference("TipoObra.count") do
      post tipo_obras_url, params: { tipo_obra: { nombre: @tipo_obra.nombre } }
    end

    assert_redirected_to tipo_obra_url(TipoObra.last)
  end

  test "should show tipo_obra" do
    get tipo_obra_url(@tipo_obra)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_obra_url(@tipo_obra)
    assert_response :success
  end

  test "should update tipo_obra" do
    patch tipo_obra_url(@tipo_obra), params: { tipo_obra: { nombre: @tipo_obra.nombre } }
    assert_redirected_to tipo_obra_url(@tipo_obra)
  end

  test "should destroy tipo_obra" do
    assert_difference("TipoObra.count", -1) do
      delete tipo_obra_url(@tipo_obra)
    end

    assert_redirected_to tipo_obras_url
  end
end
