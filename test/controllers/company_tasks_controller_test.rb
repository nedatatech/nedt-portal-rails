require 'test_helper'

class CompanyTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_task = company_tasks(:one)
  end

  test "should get index" do
    get company_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_company_task_url
    assert_response :success
  end

  test "should create company_task" do
    assert_difference('CompanyTask.count') do
      post company_tasks_url, params: { company_task: { description: @company_task.description, owner_id: @company_task.owner_id, status: @company_task.status } }
    end

    assert_redirected_to company_task_url(CompanyTask.last)
  end

  test "should show company_task" do
    get company_task_url(@company_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_task_url(@company_task)
    assert_response :success
  end

  test "should update company_task" do
    patch company_task_url(@company_task), params: { company_task: { description: @company_task.description, owner_id: @company_task.owner_id, status: @company_task.status } }
    assert_redirected_to company_task_url(@company_task)
  end

  test "should destroy company_task" do
    assert_difference('CompanyTask.count', -1) do
      delete company_task_url(@company_task)
    end

    assert_redirected_to company_tasks_url
  end
end
