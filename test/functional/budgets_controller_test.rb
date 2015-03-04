require 'test_helper'

class BudgetsControllerTest < ActionController::TestCase
  setup do
    @budget = budgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:budgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create budget" do
    assert_difference('Budget.count') do
      post :create, budget: { architect_id: @budget.architect_id, customer_id: @budget.customer_id, description: @budget.description, payment_condition_id: @budget.payment_condition_id, seller_id: @budget.seller_id, status: @budget.status }
    end

    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should show budget" do
    get :show, id: @budget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @budget
    assert_response :success
  end

  test "should update budget" do
    put :update, id: @budget, budget: { architect_id: @budget.architect_id, customer_id: @budget.customer_id, description: @budget.description, payment_condition_id: @budget.payment_condition_id, seller_id: @budget.seller_id, status: @budget.status }
    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should destroy budget" do
    assert_difference('Budget.count', -1) do
      delete :destroy, id: @budget
    end

    assert_redirected_to budgets_path
  end
end
