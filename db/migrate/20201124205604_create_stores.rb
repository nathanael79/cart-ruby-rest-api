class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :rating, null: false
      t.text :address, null: false
      t.bigint :phone, null: false

      t.timestamps
    end
  end
end
