class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_details, dependent: :destroy
  validates :total_price, presence: true, numericality: { greater_than: 0 }
end
