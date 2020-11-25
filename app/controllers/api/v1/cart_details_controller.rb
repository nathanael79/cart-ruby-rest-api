class Api::V1::CartDetailsController < ApplicationController
  before_action :set_cart_detail, only: [:show, :update, :destroy]

  # GET /cart_details
  def index
    @cart_details = CartDetail.all

    render json: @cart_details
  end

  # GET /cart_details/1
  def show
    render json: @cart_detail
  end

  # POST /cart_details
  def create
    @cart_detail = CartDetail.new(cart_detail_params)

    if @cart_detail.save
      render json: @cart_detail, status: :created, location: @cart_detail
    else
      render json: @cart_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_details/1
  def update
    if @cart_detail.update(cart_detail_params)
      render json: @cart_detail
    else
      render json: @cart_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_details/1
  def destroy
    @cart_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_detail
      @cart_detail = CartDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_detail_params
      params.require(:cart_detail).permit(:cart_id, :product_variant_detail_id, :amount, :price, :total_price)
    end
end
