class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :store, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :product_name, null: false
      t.text :description
      t.integer :weight, null: false
      t.string :condition, null: false
      t.boolean :is_insurance, null: false
      t.bigint :price, null: false
      t.bigint :stock, null: false
      t.boolean :is_available, null: false

      t.timestamps
    end
  end
end
