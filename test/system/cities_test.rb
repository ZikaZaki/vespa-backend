require 'application_system_test_case'

class CitiesTest < ApplicationSystemTestCase
  setup do
    @city = cities(:one)
  end

  test 'visiting the index' do
    visit cities_url
    assert_selector 'h1', text: 'Cities'
  end

  test 'should create city' do
    visit cities_url
    click_on 'New city'

    fill_in 'Description', with: @city.description
    fill_in 'Name', with: @city.name
    click_on 'Create City'

    assert_text 'City was successfully created'
    click_on 'Back'
  end

  test 'should update City' do
    visit city_url(@city)
    click_on 'Edit this city', match: :first

    fill_in 'Description', with: @city.description
    fill_in 'Name', with: @city.name
    click_on 'Update City'

    assert_text 'City was successfully updated'
    click_on 'Back'
  end

  test 'should destroy City' do
    visit city_url(@city)
    click_on 'Destroy this city', match: :first

    assert_text 'City was successfully destroyed'
  end
end
