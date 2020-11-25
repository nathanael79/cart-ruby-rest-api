require 'test_helper'

class VariantTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variant_type = variant_types(:one)
  end

  test "should get index" do
    get variant_types_url, as: :json
    assert_response :success
  end

  test "should create variant_type" do
    assert_difference('VariantType.count') do
      post variant_types_url, params: { variant_type: { name: @variant_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show variant_type" do
    get variant_type_url(@variant_type), as: :json
    assert_response :success
  end

  test "should update variant_type" do
    patch variant_type_url(@variant_type), params: { variant_type: { name: @variant_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy variant_type" do
    assert_difference('VariantType.count', -1) do
      delete variant_type_url(@variant_type), as: :json
    end

    assert_response 204
  end
end
