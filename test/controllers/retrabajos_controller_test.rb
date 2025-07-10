require "test_helper"

class RetrabajosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @retrabajo = retrabajos(:one)
  end

  test "should get index" do
    get retrabajos_url
    assert_response :success
  end

  test "should get new" do
    get new_retrabajo_url
    assert_response :success
  end

  test "should create retrabajo" do
    assert_difference("Retrabajo.count") do
      post retrabajos_url, params: { retrabajo: { descripcion: @retrabajo.descripcion, detalle_produccion_id: @retrabajo.detalle_produccion_id, motivo: @retrabajo.motivo } }
    end

    assert_redirected_to retrabajo_url(Retrabajo.last)
  end

  test "should show retrabajo" do
    get retrabajo_url(@retrabajo)
    assert_response :success
  end

  test "should get edit" do
    get edit_retrabajo_url(@retrabajo)
    assert_response :success
  end

  test "should update retrabajo" do
    patch retrabajo_url(@retrabajo), params: { retrabajo: { descripcion: @retrabajo.descripcion, detalle_produccion_id: @retrabajo.detalle_produccion_id, motivo: @retrabajo.motivo } }
    assert_redirected_to retrabajo_url(@retrabajo)
  end

  test "should destroy retrabajo" do
    assert_difference("Retrabajo.count", -1) do
      delete retrabajo_url(@retrabajo)
    end

    assert_redirected_to retrabajos_url
  end
end
