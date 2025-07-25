require "application_system_test_case"

class SectorsTest < ApplicationSystemTestCase
  setup do
    @sector = sectors(:one)
  end

  test "visiting the index" do
    visit sectors_url
    assert_selector "h1", text: "Sectors"
  end

  test "should create sector" do
    visit sectors_url
    click_on "New sector"

    fill_in "Nombre", with: @sector.nombre
    click_on "Create Sector"

    assert_text "Sector was successfully created"
    click_on "Back"
  end

  test "should update Sector" do
    visit sector_url(@sector)
    click_on "Edit this sector", match: :first

    fill_in "Nombre", with: @sector.nombre
    click_on "Update Sector"

    assert_text "Sector was successfully updated"
    click_on "Back"
  end

  test "should destroy Sector" do
    visit sector_url(@sector)
    click_on "Destroy this sector", match: :first

    assert_text "Sector was successfully destroyed"
  end
end
