class Api::V1::ProductVariantDetailsController < ApplicationController
  before_action :set_product_variant_detail, only: [:show, :update, :destroy]

  # GET /product_variant_details
  def index
    @product_variant_details = ProductVariantDetail.all

    render json: @product_variant_details
  end

  # GET /product_variant_details/1
  def show
    render json: @product_variant_detail
  end

  # POST /product_variant_details
  def create
    @product_variant_detail = ProductVariantDetail.new(product_variant_detail_params)

    if @product_variant_detail.save
      render json: @product_variant_detail, status: :created, location: @product_variant_detail
    else
      render json: @product_variant_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_variant_details/1
  def update
    if @product_variant_detail.update(product_variant_detail_params)
      render json: @product_variant_detail
    else
      render json: @product_variant_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_variant_details/1
  def destroy
    @product_variant_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant_detail
      @product_variant_detail = ProductVariantDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_variant_detail_params
      params.require(:product_variant_detail).permit(:product_variant_id, :name, :detail)
    end
end
