class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :total_price, null: false
      t.boolean :is_paid, null: false

      t.timestamps
    end
  end
end
