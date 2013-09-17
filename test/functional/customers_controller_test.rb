require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { address_complement: @customer.address_complement, cellphone: @customer.cellphone, city: @customer.city, landline: @customer.landline, name: @customer.name, neighbourhood: @customer.neighbourhood, postal_code: @customer.postal_code, rg: @customer.rg, street: @customer.street, street_number: @customer.street_number, tax_number: @customer.tax_number, tax_number_type: @customer.tax_number_type }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    put :update, id: @customer, customer: { address_complement: @customer.address_complement, cellphone: @customer.cellphone, city: @customer.city, landline: @customer.landline, name: @customer.name, neighbourhood: @customer.neighbourhood, postal_code: @customer.postal_code, rg: @customer.rg, street: @customer.street, street_number: @customer.street_number, tax_number: @customer.tax_number, tax_number_type: @customer.tax_number_type }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
