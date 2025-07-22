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
    click_on "Nueva Escala"

    fill_in "Categoria", with: @escala_salarial.categoria
    fill_in "Observaciones", with: @escala_salarial.observaciones
    fill_in "Sueldo base", with: @escala_salarial.sueldo_base
    click_on "Crear Escala salarial"

    assert_text "Escala salarial creado correctamente"
    click_on "Volver"
  end

  test "should update Escala salarial" do
    visit escala_salarial_url(@escala_salarial)
    click_on "Editar este escala salarial", match: :first

    fill_in "Categoria", with: @escala_salarial.categoria
    fill_in "Observaciones", with: @escala_salarial.observaciones
    fill_in "Sueldo base", with: @escala_salarial.sueldo_base
    click_on "Actualizar Escala salarial"

    assert_text "Escala salarial actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Escala salarial" do
    visit escala_salarial_url(@escala_salarial)
    click_on "Eliminar este escala salarial", match: :first

    assert_text "Escala salarial eliminado correctamente"
  end
end
