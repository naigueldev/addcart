require 'test_helper'

class CartshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartship = cartships(:one)
  end

  test "should get index" do
    get cartships_url
    assert_response :success
  end

  test "should get new" do
    get new_cartship_url
    assert_response :success
  end

  test "should create cartship" do
    assert_difference('Cartship.count') do
      post cartships_url, params: { cartship: { cart_id: @cartship.cart_id, product_id: @cartship.product_id, quantity: @cartship.quantity } }
    end

    assert_redirected_to cartship_url(Cartship.last)
  end

  test "should show cartship" do
    get cartship_url(@cartship)
    assert_response :success
  end

  test "should get edit" do
    get edit_cartship_url(@cartship)
    assert_response :success
  end

  test "should update cartship" do
    patch cartship_url(@cartship), params: { cartship: { cart_id: @cartship.cart_id, product_id: @cartship.product_id, quantity: @cartship.quantity } }
    assert_redirected_to cartship_url(@cartship)
  end

  test "should destroy cartship" do
    assert_difference('Cartship.count', -1) do
      delete cartship_url(@cartship)
    end

    assert_redirected_to cartships_url
  end
end
