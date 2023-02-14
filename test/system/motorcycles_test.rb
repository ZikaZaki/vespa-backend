require "application_system_test_case"

class MotorcyclesTest < ApplicationSystemTestCase
  setup do
    @motorcycle = motorcycles(:one)
  end

  test "visiting the index" do
    visit motorcycles_url
    assert_selector "h1", text: "Motorcycles"
  end

  test "should create motorcycle" do
    visit motorcycles_url
    click_on "New motorcycle"

    fill_in "Description", with: @motorcycle.description
    fill_in "Finance fee", with: @motorcycle.finance_fee
    fill_in "Model name", with: @motorcycle.model_name
    fill_in "Model no", with: @motorcycle.model_no
    fill_in "Production date", with: @motorcycle.production_date
    fill_in "Purchase fee", with: @motorcycle.purchase_fee
    click_on "Create Motorcycle"

    assert_text "Motorcycle was successfully created"
    click_on "Back"
  end

  test "should update Motorcycle" do
    visit motorcycle_url(@motorcycle)
    click_on "Edit this motorcycle", match: :first

    fill_in "Description", with: @motorcycle.description
    fill_in "Finance fee", with: @motorcycle.finance_fee
    fill_in "Model name", with: @motorcycle.model_name
    fill_in "Model no", with: @motorcycle.model_no
    fill_in "Production date", with: @motorcycle.production_date
    fill_in "Purchase fee", with: @motorcycle.purchase_fee
    click_on "Update Motorcycle"

    assert_text "Motorcycle was successfully updated"
    click_on "Back"
  end

  test "should destroy Motorcycle" do
    visit motorcycle_url(@motorcycle)
    click_on "Destroy this motorcycle", match: :first

    assert_text "Motorcycle was successfully destroyed"
  end
end
