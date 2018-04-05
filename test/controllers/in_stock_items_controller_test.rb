require 'test_helper'

class InStockItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @in_stock_item = in_stock_items(:one)
  end

  test "should get index" do
    get in_stock_items_url
    assert_response :success
  end

  test "should get new" do
    get new_in_stock_item_url
    assert_response :success
  end

  test "should create in_stock_item" do
    assert_difference('InStockItem.count') do
      post in_stock_items_url, params: { in_stock_item: { inventory_item_id: @in_stock_item.inventory_item_id, item_location: @in_stock_item.item_location, item_quantity: @in_stock_item.item_quantity, notes: @in_stock_item.notes } }
    end

    assert_redirected_to in_stock_item_url(InStockItem.last)
  end

  test "should show in_stock_item" do
    get in_stock_item_url(@in_stock_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_in_stock_item_url(@in_stock_item)
    assert_response :success
  end

  test "should update in_stock_item" do
    patch in_stock_item_url(@in_stock_item), params: { in_stock_item: { inventory_item_id: @in_stock_item.inventory_item_id, item_location: @in_stock_item.item_location, item_quantity: @in_stock_item.item_quantity, notes: @in_stock_item.notes } }
    assert_redirected_to in_stock_item_url(@in_stock_item)
  end

  test "should destroy in_stock_item" do
    assert_difference('InStockItem.count', -1) do
      delete in_stock_item_url(@in_stock_item)
    end

    assert_redirected_to in_stock_items_url
  end
end
