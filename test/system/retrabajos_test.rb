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
    click_on "New retrabajo"

    fill_in "Descripcion", with: @retrabajo.descripcion
    fill_in "Detalle produccion", with: @retrabajo.detalle_produccion_id
    fill_in "Motivo", with: @retrabajo.motivo
    click_on "Create Retrabajo"

    assert_text "Retrabajo was successfully created"
    click_on "Back"
  end

  test "should update Retrabajo" do
    visit retrabajo_url(@retrabajo)
    click_on "Edit this retrabajo", match: :first

    fill_in "Descripcion", with: @retrabajo.descripcion
    fill_in "Detalle produccion", with: @retrabajo.detalle_produccion_id
    fill_in "Motivo", with: @retrabajo.motivo
    click_on "Update Retrabajo"

    assert_text "Retrabajo was successfully updated"
    click_on "Back"
  end

  test "should destroy Retrabajo" do
    visit retrabajo_url(@retrabajo)
    click_on "Destroy this retrabajo", match: :first

    assert_text "Retrabajo was successfully destroyed"
  end
end
