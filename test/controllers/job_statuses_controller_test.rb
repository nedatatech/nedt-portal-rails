require 'test_helper'

class JobStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_status = job_statuses(:one)
  end

  test "should get index" do
    get job_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_job_status_url
    assert_response :success
  end

  test "should create job_status" do
    assert_difference('JobStatus.count') do
      post job_statuses_url, params: { job_status: { description: @job_status.description, name: @job_status.name } }
    end

    assert_redirected_to job_status_url(JobStatus.last)
  end

  test "should show job_status" do
    get job_status_url(@job_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_status_url(@job_status)
    assert_response :success
  end

  test "should update job_status" do
    patch job_status_url(@job_status), params: { job_status: { description: @job_status.description, name: @job_status.name } }
    assert_redirected_to job_status_url(@job_status)
  end

  test "should destroy job_status" do
    assert_difference('JobStatus.count', -1) do
      delete job_status_url(@job_status)
    end

    assert_redirected_to job_statuses_url
  end
end
