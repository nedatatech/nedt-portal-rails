require 'test_helper'

class TruckInventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @truck_inventory = truck_inventories(:one)
  end

  test "should get index" do
    get truck_inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_truck_inventory_url
    assert_response :success
  end

  test "should create truck_inventory" do
    assert_difference('TruckInventory.count') do
      post truck_inventories_url, params: { truck_inventory: { inventory_item_id: @truck_inventory.inventory_item_id, truck_id: @truck_inventory.truck_id } }
    end

    assert_redirected_to truck_inventory_url(TruckInventory.last)
  end

  test "should show truck_inventory" do
    get truck_inventory_url(@truck_inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_truck_inventory_url(@truck_inventory)
    assert_response :success
  end

  test "should update truck_inventory" do
    patch truck_inventory_url(@truck_inventory), params: { truck_inventory: { inventory_item_id: @truck_inventory.inventory_item_id, truck_id: @truck_inventory.truck_id } }
    assert_redirected_to truck_inventory_url(@truck_inventory)
  end

  test "should destroy truck_inventory" do
    assert_difference('TruckInventory.count', -1) do
      delete truck_inventory_url(@truck_inventory)
    end

    assert_redirected_to truck_inventories_url
  end
end
