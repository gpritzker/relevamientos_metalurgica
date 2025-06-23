require "application_system_test_case"

class OperariosTest < ApplicationSystemTestCase
  setup do
    @operario = operarios(:one)
  end

  test "visiting the index" do
    visit operarios_url
    assert_selector "h1", text: "Operarios"
  end

  test "should create operario" do
    visit operarios_url
    click_on "New operario"

    check "Activo" if @operario.activo
    fill_in "Legajo", with: @operario.legajo
    fill_in "Nombre", with: @operario.nombre
    fill_in "Sector", with: @operario.sector
    click_on "Create Operario"

    assert_text "Operario was successfully created"
    click_on "Back"
  end

  test "should update Operario" do
    visit operario_url(@operario)
    click_on "Edit this operario", match: :first

    check "Activo" if @operario.activo
    fill_in "Legajo", with: @operario.legajo
    fill_in "Nombre", with: @operario.nombre
    fill_in "Sector", with: @operario.sector
    click_on "Update Operario"

    assert_text "Operario was successfully updated"
    click_on "Back"
  end

  test "should destroy Operario" do
    visit operario_url(@operario)
    click_on "Destroy this operario", match: :first

    assert_text "Operario was successfully destroyed"
  end
end
