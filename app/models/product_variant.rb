class ProductVariant < ApplicationRecord
  belongs_to :product
  belongs_to :variant_type
  has_many :product_variant_details, dependent: :destroy
end
