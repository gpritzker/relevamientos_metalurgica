require "application_system_test_case"

class TipoTiempoMuertosTest < ApplicationSystemTestCase
  setup do
    @tipo_tiempo_muerto = tipo_tiempo_muertos(:one)
  end

  test "visiting the index" do
    visit tipo_tiempo_muertos_url
    assert_selector "h1", text: "Tipo tiempo muertos"
  end

  test "should create tipo tiempo muerto" do
    visit tipo_tiempo_muertos_url
    click_on "New tipo tiempo muerto"

    fill_in "Nombre", with: @tipo_tiempo_muerto.nombre
    click_on "Create Tipo tiempo muerto"

    assert_text "Tipo tiempo muerto was successfully created"
    click_on "Back"
  end

  test "should update Tipo tiempo muerto" do
    visit tipo_tiempo_muerto_url(@tipo_tiempo_muerto)
    click_on "Edit this tipo tiempo muerto", match: :first

    fill_in "Nombre", with: @tipo_tiempo_muerto.nombre
    click_on "Update Tipo tiempo muerto"

    assert_text "Tipo tiempo muerto was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo tiempo muerto" do
    visit tipo_tiempo_muerto_url(@tipo_tiempo_muerto)
    click_on "Destroy this tipo tiempo muerto", match: :first

    assert_text "Tipo tiempo muerto was successfully destroyed"
  end
end
