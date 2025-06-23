require "application_system_test_case"

class ParteDiariosTest < ApplicationSystemTestCase
  setup do
    @parte_diario = parte_diarios(:one)
  end

  test "visiting the index" do
    visit parte_diarios_url
    assert_selector "h1", text: "Parte diarios"
  end

  test "should create parte diario" do
    visit parte_diarios_url
    click_on "New parte diario"

    fill_in "Fecha", with: @parte_diario.fecha
    fill_in "Operario", with: @parte_diario.operario
    fill_in "Sector", with: @parte_diario.sector
    fill_in "Turno", with: @parte_diario.turno
    fill_in "Usuario", with: @parte_diario.usuario_id
    click_on "Create Parte diario"

    assert_text "Parte diario was successfully created"
    click_on "Back"
  end

  test "should update Parte diario" do
    visit parte_diario_url(@parte_diario)
    click_on "Edit this parte diario", match: :first

    fill_in "Fecha", with: @parte_diario.fecha
    fill_in "Operario", with: @parte_diario.operario
    fill_in "Sector", with: @parte_diario.sector
    fill_in "Turno", with: @parte_diario.turno
    fill_in "Usuario", with: @parte_diario.usuario_id
    click_on "Update Parte diario"

    assert_text "Parte diario was successfully updated"
    click_on "Back"
  end

  test "should destroy Parte diario" do
    visit parte_diario_url(@parte_diario)
    click_on "Destroy this parte diario", match: :first

    assert_text "Parte diario was successfully destroyed"
  end
end
