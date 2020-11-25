require 'test_helper'

class ProductVariantDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_variant_detail = product_variant_details(:one)
  end

  test "should get index" do
    get product_variant_details_url, as: :json
    assert_response :success
  end

  test "should create product_variant_detail" do
    assert_difference('ProductVariantDetail.count') do
      post product_variant_details_url, params: { product_variant_detail: { detail: @product_variant_detail.detail, name: @product_variant_detail.name, product_variant_id: @product_variant_detail.product_variant_id } }, as: :json
    end

    assert_response 201
  end

  test "should show product_variant_detail" do
    get product_variant_detail_url(@product_variant_detail), as: :json
    assert_response :success
  end

  test "should update product_variant_detail" do
    patch product_variant_detail_url(@product_variant_detail), params: { product_variant_detail: { detail: @product_variant_detail.detail, name: @product_variant_detail.name, product_variant_id: @product_variant_detail.product_variant_id } }, as: :json
    assert_response 200
  end

  test "should destroy product_variant_detail" do
    assert_difference('ProductVariantDetail.count', -1) do
      delete product_variant_detail_url(@product_variant_detail), as: :json
    end

    assert_response 204
  end
end
