require "test_helper"

class EscalaSalarialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escala_salarial = escala_salarials(:one)
  end

  test "should get index" do
    get escala_salarials_url
    assert_response :success
  end

  test "should get new" do
    get new_escala_salarial_url
    assert_response :success
  end

  test "should create escala_salarial" do
    assert_difference("EscalaSalarial.count") do
      post escala_salarials_url, params: { escala_salarial: { categoria: @escala_salarial.categoria, observaciones: @escala_salarial.observaciones, sueldo_base: @escala_salarial.sueldo_base } }
    end

    assert_redirected_to escala_salarial_url(EscalaSalarial.last)
  end

  test "should show escala_salarial" do
    get escala_salarial_url(@escala_salarial)
    assert_response :success
  end

  test "should get edit" do
    get edit_escala_salarial_url(@escala_salarial)
    assert_response :success
  end

  test "should update escala_salarial" do
    patch escala_salarial_url(@escala_salarial), params: { escala_salarial: { categoria: @escala_salarial.categoria, observaciones: @escala_salarial.observaciones, sueldo_base: @escala_salarial.sueldo_base } }
    assert_redirected_to escala_salarial_url(@escala_salarial)
  end

  test "should destroy escala_salarial" do
    assert_difference("EscalaSalarial.count", -1) do
      delete escala_salarial_url(@escala_salarial)
    end

    assert_redirected_to escala_salarials_url
  end
end
