require 'test_helper'

class ReservedItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reserved_item = reserved_items(:one)
  end

  test "should get index" do
    get reserved_items_url
    assert_response :success
  end

  test "should get new" do
    get new_reserved_item_url
    assert_response :success
  end

  test "should create reserved_item" do
    assert_difference('ReservedItem.count') do
      post reserved_items_url, params: { reserved_item: { inventory_item_id: @reserved_item.inventory_item_id, job_id: @reserved_item.job_id, quantity: @reserved_item.quantity } }
    end

    assert_redirected_to reserved_item_url(ReservedItem.last)
  end

  test "should show reserved_item" do
    get reserved_item_url(@reserved_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_reserved_item_url(@reserved_item)
    assert_response :success
  end

  test "should update reserved_item" do
    patch reserved_item_url(@reserved_item), params: { reserved_item: { inventory_item_id: @reserved_item.inventory_item_id, job_id: @reserved_item.job_id, quantity: @reserved_item.quantity } }
    assert_redirected_to reserved_item_url(@reserved_item)
  end

  test "should destroy reserved_item" do
    assert_difference('ReservedItem.count', -1) do
      delete reserved_item_url(@reserved_item)
    end

    assert_redirected_to reserved_items_url
  end
end
