require "application_system_test_case"

class EscalaSalarialsTest < ApplicationSystemTestCase
  setup do
    @escala_salarial = escala_salarials(:one)
  end

  test "visiting the index" do
    visit escala_salarials_url
    assert_selector "h1", text: "Escala salarials"
  end

  test "should create escala salarial" do
    visit escala_salarials_url
    click_on "New escala salarial"

    fill_in "Categoria", with: @escala_salarial.categoria
    fill_in "Observaciones", with: @escala_salarial.observaciones
    fill_in "Sueldo base", with: @escala_salarial.sueldo_base
    click_on "Create Escala salarial"

    assert_text "Escala salarial was successfully created"
    click_on "Back"
  end

  test "should update Escala salarial" do
    visit escala_salarial_url(@escala_salarial)
    click_on "Edit this escala salarial", match: :first

    fill_in "Categoria", with: @escala_salarial.categoria
    fill_in "Observaciones", with: @escala_salarial.observaciones
    fill_in "Sueldo base", with: @escala_salarial.sueldo_base
    click_on "Update Escala salarial"

    assert_text "Escala salarial was successfully updated"
    click_on "Back"
  end

  test "should destroy Escala salarial" do
    visit escala_salarial_url(@escala_salarial)
    click_on "Destroy this escala salarial", match: :first

    assert_text "Escala salarial was successfully destroyed"
  end
end
