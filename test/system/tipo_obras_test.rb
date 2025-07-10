require "application_system_test_case"

class TipoObrasTest < ApplicationSystemTestCase
  setup do
    @tipo_obra = tipo_obras(:one)
  end

  test "visiting the index" do
    visit tipo_obras_url
    assert_selector "h1", text: "Tipo obras"
  end

  test "should create tipo obra" do
    visit tipo_obras_url
    click_on "New tipo obra"

    fill_in "Nombre", with: @tipo_obra.nombre
    click_on "Create Tipo obra"

    assert_text "Tipo obra was successfully created"
    click_on "Back"
  end

  test "should update Tipo obra" do
    visit tipo_obra_url(@tipo_obra)
    click_on "Edit this tipo obra", match: :first

    fill_in "Nombre", with: @tipo_obra.nombre
    click_on "Update Tipo obra"

    assert_text "Tipo obra was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo obra" do
    visit tipo_obra_url(@tipo_obra)
    click_on "Destroy this tipo obra", match: :first

    assert_text "Tipo obra was successfully destroyed"
  end
end
