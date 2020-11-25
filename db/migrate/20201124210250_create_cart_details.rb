class CreateCartDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_details do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :product_variant_detail, null: false, foreign_key: true
      t.bigint :amount, null: false
      t.bigint :price, null: false
      t.bigint :total_price, null: false

      t.timestamps
    end
  end
end
