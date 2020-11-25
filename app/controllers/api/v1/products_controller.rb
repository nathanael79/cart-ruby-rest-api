class Api::V1::ProductsController < ApplicationController
  before_action :authorized
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    products = Product.includes(:product_variants, :product_variant_details).all
    result = []
    products.each do |product|
      result << [
          product: product,
          variantDetail: product.product_variant_details
      ]
    end

    render json: result
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new
    @product.store_id = product_params[:store_id]
    @product.category_id = product_params[:category_id]
    @product.product_name = product_params[:product_name]
    @product.description = product_params[:description]
    @product.weight = product_params[:weight]
    @product.condition = product_params[:condition]
    @product.is_insurance = product_params[:is_insurance]
    @product.price = product_params[:price]
    @product.stock = product_params[:stock]
    @product.is_available = product_params[:is_available]
    if @product.save
      product_params[:variant_type_details].each do |variant_type_detail|
        @productVariant = ProductVariant.new
        @productVariant.product_id = @product.id
        @productVariant.variant_type_id = variant_type_detail[:variant_type_id]
        if @productVariant.save
          @productVariantDetail = ProductVariantDetail.new
          @productVariantDetail.product_variant_id = @productVariant.id
          @productVariantDetail.name = variant_type_detail[:variant_type_name]
          @productVariantDetail.detail = variant_type_detail[:variant_type_desc]
          if @productVariantDetail.save
            render json: @product, status: :created, location: api_v1_product_url(@product)
          else
            render json: @product.errors, status: :unprocessable_entity
          end
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    product = Product.find_by_id(params[:id])
    product.store_id = update_params[:store_id]
    product.category_id = update_params[:category_id]
    product.product_name = update_params[:product_name]
    product.description = update_params[:description]
    product.weight = update_params[:weight]
    product.condition = update_params[:condition]
    product.is_insurance = update_params[:is_insurance]
    product.price = update_params[:price]
    product.stock = update_params[:stock]
    product.is_available = update_params[:is_available]
    product.save

    update_params[:variant_type_details].each do |variant_type_detail|
      productVariantDetail = ProductVariantDetail.find_by_id(variant_type_detail[:product_variant_id])
      productVariantDetail.name = variant_type_detail[:product_variant_name]
      productVariantDetail.detail = variant_type_detail[:product_variant_desc]
      productVariantDetail.save
    end

    if product.valid?
      render json: {
          data: product
      }, status: :ok
    else
      render json: {
          error: product.errors
      }, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def product_params
    params.permit(:store_id, :category_id, :product_name, :description, :weight, :condition, :is_insurance, :price, :stock, :is_available, :variant_type_details => [:variant_type_id, :variant_type_name, :variant_type_desc])
  end

  def update_params
    params.permit(:store_id, :category_id, :product_name, :description, :weight, :condition, :is_insurance, :price, :stock, :is_available, :variant_type_details => [:product_variant_id, :product_variant_name, :product_variant_desc])
  end
end
