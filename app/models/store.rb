class Store < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true
  validates :phone, presence: true
end
