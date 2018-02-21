require 'test_helper'

class TransTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trans_type = trans_types(:one)
  end

  test "should get index" do
    get trans_types_url
    assert_response :success
  end

  test "should get new" do
    get new_trans_type_url
    assert_response :success
  end

  test "should create trans_type" do
    assert_difference('TransType.count') do
      post trans_types_url, params: { trans_type: { description: @trans_type.description, name: @trans_type.name } }
    end

    assert_redirected_to trans_type_url(TransType.last)
  end

  test "should show trans_type" do
    get trans_type_url(@trans_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_trans_type_url(@trans_type)
    assert_response :success
  end

  test "should update trans_type" do
    patch trans_type_url(@trans_type), params: { trans_type: { description: @trans_type.description, name: @trans_type.name } }
    assert_redirected_to trans_type_url(@trans_type)
  end

  test "should destroy trans_type" do
    assert_difference('TransType.count', -1) do
      delete trans_type_url(@trans_type)
    end

    assert_redirected_to trans_types_url
  end
end
