class CreateProductVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.references :variant_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
