require 'test_helper'

class InvoiceNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_number = invoice_numbers(:one)
  end

  test "should get index" do
    get invoice_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_number_url
    assert_response :success
  end

  test "should create invoice_number" do
    assert_difference('InvoiceNumber.count') do
      post invoice_numbers_url, params: { invoice_number: { value: @invoice_number.value } }
    end

    assert_redirected_to invoice_number_url(InvoiceNumber.last)
  end

  test "should show invoice_number" do
    get invoice_number_url(@invoice_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_number_url(@invoice_number)
    assert_response :success
  end

  test "should update invoice_number" do
    patch invoice_number_url(@invoice_number), params: { invoice_number: { value: @invoice_number.value } }
    assert_redirected_to invoice_number_url(@invoice_number)
  end

  test "should destroy invoice_number" do
    assert_difference('InvoiceNumber.count', -1) do
      delete invoice_number_url(@invoice_number)
    end

    assert_redirected_to invoice_numbers_url
  end
end
