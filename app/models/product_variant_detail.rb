class ProductVariantDetail < ApplicationRecord
  belongs_to :product_variant
  validates :product_variant_id, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true
end
