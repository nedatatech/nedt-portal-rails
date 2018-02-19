require 'test_helper'

class SettingsDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @settings_datum = settings_data(:one)
  end

  test "should get index" do
    get settings_data_url
    assert_response :success
  end

  test "should get new" do
    get new_settings_datum_url
    assert_response :success
  end

  test "should create settings_datum" do
    assert_difference('SettingsDatum.count') do
      post settings_data_url, params: { settings_datum: { description: @settings_datum.description, name: @settings_datum.name, type: @settings_datum.type } }
    end

    assert_redirected_to settings_datum_url(SettingsDatum.last)
  end

  test "should show settings_datum" do
    get settings_datum_url(@settings_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_settings_datum_url(@settings_datum)
    assert_response :success
  end

  test "should update settings_datum" do
    patch settings_datum_url(@settings_datum), params: { settings_datum: { description: @settings_datum.description, name: @settings_datum.name, type: @settings_datum.type } }
    assert_redirected_to settings_datum_url(@settings_datum)
  end

  test "should destroy settings_datum" do
    assert_difference('SettingsDatum.count', -1) do
      delete settings_datum_url(@settings_datum)
    end

    assert_redirected_to settings_data_url
  end
end
