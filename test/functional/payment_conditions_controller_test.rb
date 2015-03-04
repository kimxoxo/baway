require 'test_helper'

class PaymentConditionsControllerTest < ActionController::TestCase
  setup do
    @payment_condition = payment_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_condition" do
    assert_difference('PaymentCondition.count') do
      post :create, payment_condition: { discount: @payment_condition.discount, name: @payment_condition.name, num_monthly_payments: @payment_condition.num_monthly_payments }
    end

    assert_redirected_to payment_condition_path(assigns(:payment_condition))
  end

  test "should show payment_condition" do
    get :show, id: @payment_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_condition
    assert_response :success
  end

  test "should update payment_condition" do
    put :update, id: @payment_condition, payment_condition: { discount: @payment_condition.discount, name: @payment_condition.name, num_monthly_payments: @payment_condition.num_monthly_payments }
    assert_redirected_to payment_condition_path(assigns(:payment_condition))
  end

  test "should destroy payment_condition" do
    assert_difference('PaymentCondition.count', -1) do
      delete :destroy, id: @payment_condition
    end

    assert_redirected_to payment_conditions_path
  end
end
