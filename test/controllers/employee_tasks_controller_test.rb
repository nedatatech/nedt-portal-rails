require 'test_helper'

class EmployeeTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_task = employee_tasks(:one)
  end

  test "should get index" do
    get employee_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_task_url
    assert_response :success
  end

  test "should create employee_task" do
    assert_difference('EmployeeTask.count') do
      post employee_tasks_url, params: { employee_task: { description: @employee_task.description, owner_id: @employee_task.owner_id, status_id: @employee_task.status_id } }
    end

    assert_redirected_to employee_task_url(EmployeeTask.last)
  end

  test "should show employee_task" do
    get employee_task_url(@employee_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_task_url(@employee_task)
    assert_response :success
  end

  test "should update employee_task" do
    patch employee_task_url(@employee_task), params: { employee_task: { description: @employee_task.description, owner_id: @employee_task.owner_id, status_id: @employee_task.status_id } }
    assert_redirected_to employee_task_url(@employee_task)
  end

  test "should destroy employee_task" do
    assert_difference('EmployeeTask.count', -1) do
      delete employee_task_url(@employee_task)
    end

    assert_redirected_to employee_tasks_url
  end
end
