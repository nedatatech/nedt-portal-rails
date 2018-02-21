require 'test_helper'

class PaymentToFromsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_to_from = payment_to_froms(:one)
  end

  test "should get index" do
    get payment_to_froms_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_to_from_url
    assert_response :success
  end

  test "should create payment_to_from" do
    assert_difference('PaymentToFrom.count') do
      post payment_to_froms_url, params: { payment_to_from: { pay_from_id: @payment_to_from.pay_from_id, pay_from_type: @payment_to_from.pay_from_type, pay_to_id: @payment_to_from.pay_to_id, pay_to_type: @payment_to_from.pay_to_type } }
    end

    assert_redirected_to payment_to_from_url(PaymentToFrom.last)
  end

  test "should show payment_to_from" do
    get payment_to_from_url(@payment_to_from)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_to_from_url(@payment_to_from)
    assert_response :success
  end

  test "should update payment_to_from" do
    patch payment_to_from_url(@payment_to_from), params: { payment_to_from: { pay_from_id: @payment_to_from.pay_from_id, pay_from_type: @payment_to_from.pay_from_type, pay_to_id: @payment_to_from.pay_to_id, pay_to_type: @payment_to_from.pay_to_type } }
    assert_redirected_to payment_to_from_url(@payment_to_from)
  end

  test "should destroy payment_to_from" do
    assert_difference('PaymentToFrom.count', -1) do
      delete payment_to_from_url(@payment_to_from)
    end

    assert_redirected_to payment_to_froms_url
  end
end
