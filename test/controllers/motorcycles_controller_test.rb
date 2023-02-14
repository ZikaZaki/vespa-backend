require "test_helper"

class MotorcyclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motorcycle = motorcycles(:one)
  end

  test "should get index" do
    get motorcycles_url
    assert_response :success
  end

  test "should get new" do
    get new_motorcycle_url
    assert_response :success
  end

  test "should create motorcycle" do
    assert_difference("Motorcycle.count") do
      post motorcycles_url, params: { motorcycle: { description: @motorcycle.description, finance_fee: @motorcycle.finance_fee, model_name: @motorcycle.model_name, model_no: @motorcycle.model_no, production_date: @motorcycle.production_date, purchase_fee: @motorcycle.purchase_fee } }
    end

    assert_redirected_to motorcycle_url(Motorcycle.last)
  end

  test "should show motorcycle" do
    get motorcycle_url(@motorcycle)
    assert_response :success
  end

  test "should get edit" do
    get edit_motorcycle_url(@motorcycle)
    assert_response :success
  end

  test "should update motorcycle" do
    patch motorcycle_url(@motorcycle), params: { motorcycle: { description: @motorcycle.description, finance_fee: @motorcycle.finance_fee, model_name: @motorcycle.model_name, model_no: @motorcycle.model_no, production_date: @motorcycle.production_date, purchase_fee: @motorcycle.purchase_fee } }
    assert_redirected_to motorcycle_url(@motorcycle)
  end

  test "should destroy motorcycle" do
    assert_difference("Motorcycle.count", -1) do
      delete motorcycle_url(@motorcycle)
    end

    assert_redirected_to motorcycles_url
  end
end
