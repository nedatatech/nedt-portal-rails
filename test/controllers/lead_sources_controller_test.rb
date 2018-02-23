require 'test_helper'

class LeadSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lead_source = lead_sources(:one)
  end

  test "should get index" do
    get lead_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_lead_source_url
    assert_response :success
  end

  test "should create lead_source" do
    assert_difference('LeadSource.count') do
      post lead_sources_url, params: { lead_source: { description_id: @lead_source.description_id, name_id: @lead_source.name_id } }
    end

    assert_redirected_to lead_source_url(LeadSource.last)
  end

  test "should show lead_source" do
    get lead_source_url(@lead_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_lead_source_url(@lead_source)
    assert_response :success
  end

  test "should update lead_source" do
    patch lead_source_url(@lead_source), params: { lead_source: { description_id: @lead_source.description_id, name_id: @lead_source.name_id } }
    assert_redirected_to lead_source_url(@lead_source)
  end

  test "should destroy lead_source" do
    assert_difference('LeadSource.count', -1) do
      delete lead_source_url(@lead_source)
    end

    assert_redirected_to lead_sources_url
  end
end
