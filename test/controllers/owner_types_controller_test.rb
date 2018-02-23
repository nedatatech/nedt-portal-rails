require 'test_helper'

class OwnerTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owner_type = owner_types(:one)
  end

  test "should get index" do
    get owner_types_url
    assert_response :success
  end

  test "should get new" do
    get new_owner_type_url
    assert_response :success
  end

  test "should create owner_type" do
    assert_difference('OwnerType.count') do
      post owner_types_url, params: { owner_type: { description: @owner_type.description, name: @owner_type.name } }
    end

    assert_redirected_to owner_type_url(OwnerType.last)
  end

  test "should show owner_type" do
    get owner_type_url(@owner_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_owner_type_url(@owner_type)
    assert_response :success
  end

  test "should update owner_type" do
    patch owner_type_url(@owner_type), params: { owner_type: { description: @owner_type.description, name: @owner_type.name } }
    assert_redirected_to owner_type_url(@owner_type)
  end

  test "should destroy owner_type" do
    assert_difference('OwnerType.count', -1) do
      delete owner_type_url(@owner_type)
    end

    assert_redirected_to owner_types_url
  end
end
