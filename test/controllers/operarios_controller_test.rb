require "test_helper"

class OperariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operario = operarios(:one)
  end

  test "should get index" do
    get operarios_url
    assert_response :success
  end

  test "should get new" do
    get new_operario_url
    assert_response :success
  end

  test "should create operario" do
    assert_difference("Operario.count") do
      post operarios_url, params: { operario: { activo: @operario.activo, legajo: @operario.legajo, nombre: @operario.nombre, sector: @operario.sector } }
    end

    assert_redirected_to operario_url(Operario.last)
  end

  test "should show operario" do
    get operario_url(@operario)
    assert_response :success
  end

  test "should get edit" do
    get edit_operario_url(@operario)
    assert_response :success
  end

  test "should update operario" do
    patch operario_url(@operario), params: { operario: { activo: @operario.activo, legajo: @operario.legajo, nombre: @operario.nombre, sector: @operario.sector } }
    assert_redirected_to operario_url(@operario)
  end

  test "should destroy operario" do
    assert_difference("Operario.count", -1) do
      delete operario_url(@operario)
    end

    assert_redirected_to operarios_url
  end
end
