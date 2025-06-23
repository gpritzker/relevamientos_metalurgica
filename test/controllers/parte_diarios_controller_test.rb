require "test_helper"

class ParteDiariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parte_diario = parte_diarios(:one)
  end

  test "should get index" do
    get parte_diarios_url
    assert_response :success
  end

  test "should get new" do
    get new_parte_diario_url
    assert_response :success
  end

  test "should create parte_diario" do
    assert_difference("ParteDiario.count") do
      post parte_diarios_url, params: { parte_diario: { fecha: @parte_diario.fecha, operario: @parte_diario.operario, sector: @parte_diario.sector, turno: @parte_diario.turno, usuario_id: @parte_diario.usuario_id } }
    end

    assert_redirected_to parte_diario_url(ParteDiario.last)
  end

  test "should show parte_diario" do
    get parte_diario_url(@parte_diario)
    assert_response :success
  end

  test "should get edit" do
    get edit_parte_diario_url(@parte_diario)
    assert_response :success
  end

  test "should update parte_diario" do
    patch parte_diario_url(@parte_diario), params: { parte_diario: { fecha: @parte_diario.fecha, operario: @parte_diario.operario, sector: @parte_diario.sector, turno: @parte_diario.turno, usuario_id: @parte_diario.usuario_id } }
    assert_redirected_to parte_diario_url(@parte_diario)
  end

  test "should destroy parte_diario" do
    assert_difference("ParteDiario.count", -1) do
      delete parte_diario_url(@parte_diario)
    end

    assert_redirected_to parte_diarios_url
  end
end
