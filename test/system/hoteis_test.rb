require "application_system_test_case"

class HoteisTest < ApplicationSystemTestCase
  setup do
    @hotel = hoteis(:one)
  end

  test "visiting the index" do
    visit hoteis_url
    assert_selector "h1", text: "Hoteis"
  end

  test "should create hotel" do
    visit hoteis_url
    click_on "New hotel"

    fill_in "Endereco", with: @hotel.endereco
    fill_in "Nome", with: @hotel.nome
    click_on "Create Hotel"

    assert_text "Hotel was successfully created"
    click_on "Back"
  end

  test "should update Hotel" do
    visit hotel_url(@hotel)
    click_on "Edit this hotel", match: :first

    fill_in "Endereco", with: @hotel.endereco
    fill_in "Nome", with: @hotel.nome
    click_on "Update Hotel"

    assert_text "Hotel was successfully updated"
    click_on "Back"
  end

  test "should destroy Hotel" do
    visit hotel_url(@hotel)
    click_on "Destroy this hotel", match: :first

    assert_text "Hotel was successfully destroyed"
  end
end
