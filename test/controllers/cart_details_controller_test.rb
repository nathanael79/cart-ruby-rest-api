require 'test_helper'

class CartDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart_detail = cart_details(:one)
  end

  test "should get index" do
    get cart_details_url, as: :json
    assert_response :success
  end

  test "should create cart_detail" do
    assert_difference('CartDetail.count') do
      post cart_details_url, params: { cart_detail: { amount: @cart_detail.amount, cart_id: @cart_detail.cart_id, price: @cart_detail.price, product_variant_detail_id: @cart_detail.product_variant_detail_id, total_price: @cart_detail.total_price } }, as: :json
    end

    assert_response 201
  end

  test "should show cart_detail" do
    get cart_detail_url(@cart_detail), as: :json
    assert_response :success
  end

  test "should update cart_detail" do
    patch cart_detail_url(@cart_detail), params: { cart_detail: { amount: @cart_detail.amount, cart_id: @cart_detail.cart_id, price: @cart_detail.price, product_variant_detail_id: @cart_detail.product_variant_detail_id, total_price: @cart_detail.total_price } }, as: :json
    assert_response 200
  end

  test "should destroy cart_detail" do
    assert_difference('CartDetail.count', -1) do
      delete cart_detail_url(@cart_detail), as: :json
    end

    assert_response 204
  end
end
