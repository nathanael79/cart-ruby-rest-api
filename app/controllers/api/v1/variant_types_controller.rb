class Api::V1::VariantTypesController < ApplicationController
  before_action :authorized
  before_action :set_variant_type, only: [:show, :update, :destroy]

  # GET /variant_types
  def index
    @variant_types = VariantType.all

    render json: @variant_types
  end

  # GET /variant_types/1
  def show
    render json: @variant_type
  end

  # POST /variant_types
  def create
    @variant_type = VariantType.new(variant_type_params)

    if @variant_type.save
      render json: @variant_type, status: :created, location: @variant_type
    else
      render json: @variant_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /variant_types/1
  def update
    if @variant_type.update(variant_type_params)
      render json: @variant_type
    else
      render json: @variant_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /variant_types/1
  def destroy
    @variant_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant_type
      @variant_type = VariantType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def variant_type_params
      params.require(:variant_type).permit(:name)
    end
end
