require "application_system_test_case"

class RetrabajosTest < ApplicationSystemTestCase
  setup do
    @retrabajo = retrabajos(:one)
  end

  test "visiting the index" do
    visit retrabajos_url
    assert_selector "h1", text: "Retrabajos"
  end

  test "should create retrabajo" do
    visit retrabajos_url
    click_on "Nuevo Retrabajo"

    fill_in "Descripcion", with: @retrabajo.descripcion
    fill_in "Detalle produccion", with: @retrabajo.detalle_produccion_id
    fill_in "Motivo", with: @retrabajo.motivo
    click_on "Crear Retrabajo"

    assert_text "Retrabajo creado correctamente"
    click_on "Volver"
  end

  test "should update Retrabajo" do
    visit retrabajo_url(@retrabajo)
    click_on "Editar este retrabajo", match: :first

    fill_in "Descripcion", with: @retrabajo.descripcion
    fill_in "Detalle produccion", with: @retrabajo.detalle_produccion_id
    fill_in "Motivo", with: @retrabajo.motivo
    click_on "Actualizar Retrabajo"

    assert_text "Retrabajo actualizado correctamente"
    click_on "Volver"
  end

  test "should destroy Retrabajo" do
    visit retrabajo_url(@retrabajo)
    click_on "Eliminar este retrabajo", match: :first

    assert_text "Retrabajo eliminado correctamente"
  end
end
