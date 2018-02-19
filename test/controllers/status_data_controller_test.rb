require 'test_helper'

class StatusDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_datum = status_data(:one)
  end

  test "should get index" do
    get status_data_url
    assert_response :success
  end

  test "should get new" do
    get new_status_datum_url
    assert_response :success
  end

  test "should create status_datum" do
    assert_difference('StatusDatum.count') do
      post status_data_url, params: { status_datum: { description: @status_datum.description, name: @status_datum.name } }
    end

    assert_redirected_to status_datum_url(StatusDatum.last)
  end

  test "should show status_datum" do
    get status_datum_url(@status_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_datum_url(@status_datum)
    assert_response :success
  end

  test "should update status_datum" do
    patch status_datum_url(@status_datum), params: { status_datum: { description: @status_datum.description, name: @status_datum.name } }
    assert_redirected_to status_datum_url(@status_datum)
  end

  test "should destroy status_datum" do
    assert_difference('StatusDatum.count', -1) do
      delete status_datum_url(@status_datum)
    end

    assert_redirected_to status_data_url
  end
end
