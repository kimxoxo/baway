require 'test_helper'

class SuppliersControllerTest < ActionController::TestCase
  setup do
    @supplier = suppliers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suppliers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier" do
    assert_difference('Supplier.count') do
      post :create, supplier: { address_complement: @supplier.address_complement, cellphone: @supplier.cellphone, city: @supplier.city, cnpj: @supplier.cnpj, ie: @supplier.ie, landline: @supplier.landline, name: @supplier.name, neighbourhood: @supplier.neighbourhood, postal_code: @supplier.postal_code, street: @supplier.street, street_number: @supplier.street_number }
    end

    assert_redirected_to supplier_path(assigns(:supplier))
  end

  test "should show supplier" do
    get :show, id: @supplier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplier
    assert_response :success
  end

  test "should update supplier" do
    put :update, id: @supplier, supplier: { address_complement: @supplier.address_complement, cellphone: @supplier.cellphone, city: @supplier.city, cnpj: @supplier.cnpj, ie: @supplier.ie, landline: @supplier.landline, name: @supplier.name, neighbourhood: @supplier.neighbourhood, postal_code: @supplier.postal_code, street: @supplier.street, street_number: @supplier.street_number }
    assert_redirected_to supplier_path(assigns(:supplier))
  end

  test "should destroy supplier" do
    assert_difference('Supplier.count', -1) do
      delete :destroy, id: @supplier
    end

    assert_redirected_to suppliers_path
  end
end
