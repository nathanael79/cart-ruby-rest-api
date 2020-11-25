class CreateProductVariantDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :product_variant_details do |t|
      t.references :product_variant, null: false, foreign_key: true
      t.string :name, null: false, limit: 100
      t.text :detail, null: true

      t.timestamps
    end
  end
end
