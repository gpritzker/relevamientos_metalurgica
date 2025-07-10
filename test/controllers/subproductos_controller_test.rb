require "test_helper"

class SubproductosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subproducto = subproductos(:one)
  end

  test "should get index" do
    get subproductos_url
    assert_response :success
  end

  test "should get new" do
    get new_subproducto_url
    assert_response :success
  end

  test "should create subproducto" do
    assert_difference("Subproducto.count") do
      post subproductos_url, params: { subproducto: { sector_id: @subproducto.sector_id, nombre: @subproducto.nombre, producto_id: @subproducto.producto_id } }
    end

    assert_redirected_to subproducto_url(Subproducto.last)
  end

  test "should show subproducto" do
    get subproducto_url(@subproducto)
    assert_response :success
  end

  test "should get edit" do
    get edit_subproducto_url(@subproducto)
    assert_response :success
  end

  test "should update subproducto" do
    patch subproducto_url(@subproducto), params: { subproducto: { sector_id: @subproducto.sector_id, nombre: @subproducto.nombre, producto_id: @subproducto.producto_id } }
    assert_redirected_to subproducto_url(@subproducto)
  end

  test "should destroy subproducto" do
    assert_difference("Subproducto.count", -1) do
      delete subproducto_url(@subproducto)
    end

    assert_redirected_to subproductos_url
  end
end
