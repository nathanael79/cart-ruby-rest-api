class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category
  has_many :product_variants, dependent: :destroy
  has_many :product_variant_details, :through => :product_variants, dependent: :destroy
  validates :store_id, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true, numericality: { greater_than: 0 }
  validates :product_name, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :is_insurance, presence: true, inclusion: { in: [ true, false ] }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true, numericality: { greater_than: 0 }
  validates :is_available, presence: true, inclusion: { in: [ true, false ] }
end
