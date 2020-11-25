require 'test_helper'

class ProductVariantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_variant = product_variants(:one)
  end

  test "should get index" do
    get product_variants_url, as: :json
    assert_response :success
  end

  test "should create product_variant" do
    assert_difference('ProductVariant.count') do
      post product_variants_url, params: { product_variant: { product_id: @product_variant.product_id, variant_type_id: @product_variant.variant_type_id } }, as: :json
    end

    assert_response 201
  end

  test "should show product_variant" do
    get product_variant_url(@product_variant), as: :json
    assert_response :success
  end

  test "should update product_variant" do
    patch product_variant_url(@product_variant), params: { product_variant: { product_id: @product_variant.product_id, variant_type_id: @product_variant.variant_type_id } }, as: :json
    assert_response 200
  end

  test "should destroy product_variant" do
    assert_difference('ProductVariant.count', -1) do
      delete product_variant_url(@product_variant), as: :json
    end

    assert_response 204
  end
end
