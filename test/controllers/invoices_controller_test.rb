require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { customer_id: @invoice.customer_id, end_job: @invoice.end_job, hours: @invoice.hours, invoice_num: @invoice.invoice_num, parts_used_id: @invoice.parts_used_id, start_job: @invoice.start_job, status: @invoice.status, techs_on_job_id: @invoice.techs_on_job_id } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { customer_id: @invoice.customer_id, end_job: @invoice.end_job, hours: @invoice.hours, invoice_num: @invoice.invoice_num, parts_used_id: @invoice.parts_used_id, start_job: @invoice.start_job, status: @invoice.status, techs_on_job_id: @invoice.techs_on_job_id } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
