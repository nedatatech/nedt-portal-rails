require 'test_helper'

class ItemBrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_brand = item_brands(:one)
  end

  test "should get index" do
    get item_brands_url
    assert_response :success
  end

  test "should get new" do
    get new_item_brand_url
    assert_response :success
  end

  test "should create item_brand" do
    assert_difference('ItemBrand.count') do
      post item_brands_url, params: { item_brand: { description: @item_brand.description, name: @item_brand.name } }
    end

    assert_redirected_to item_brand_url(ItemBrand.last)
  end

  test "should show item_brand" do
    get item_brand_url(@item_brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_brand_url(@item_brand)
    assert_response :success
  end

  test "should update item_brand" do
    patch item_brand_url(@item_brand), params: { item_brand: { description: @item_brand.description, name: @item_brand.name } }
    assert_redirected_to item_brand_url(@item_brand)
  end

  test "should destroy item_brand" do
    assert_difference('ItemBrand.count', -1) do
      delete item_brand_url(@item_brand)
    end

    assert_redirected_to item_brands_url
  end
end
