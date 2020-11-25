class CartDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :store
  belongs_to :product_variant_detail
end
