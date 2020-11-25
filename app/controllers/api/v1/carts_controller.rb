class Api::V1::CartsController < ApplicationController
  before_action :authorized
  before_action :set_cart, only: [:show, :update, :destroy]

  # GET /carts
  def index
    carts = Cart.includes(:cart_details).all
    result = []
    carts.each do |cart|
      result << [
          cart: cart,
          cartDetail: cart.cart_details
      ]
    end

    render json: result
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  # POST /carts
  def create
    cart = Cart.new
    cart.user_id = @user.id
    cart.total_price = cart_params[:total_price]
    cart.save
    if cart.valid?
      cart_params[:cart_details].each do |cart_detail|
        cartDetail = CartDetail.new
        cartDetail.cart_id = cart.id
        cartDetail.store_id = cart_detail[:store_id]
        cartDetail.product_variant_detail_id = cart_detail[:product_variant_detail_id]
        cartDetail.amount = cart_detail[:amount]
        cartDetail.price = cart_detail[:price]
        cartDetail.total_price = cart_detail[:total_price]
        cartDetail.save
      end
    end
    render json: {
        cart: cart,
        cartDetail: cart.cart_details
    }, status: :created
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cart_params
    params.permit(:total_price, :cart_details => [:store_id, :product_variant_detail_id, :amount, :price, :total_price])
  end
end
