class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :color, optional: true
      t.string :style, optional: true
      t.serial :sku, limit: 12
      t.text :description, null: false
      t.integer :inventory, default: 0

      t.timestamps
    end
    add_index :products, :name, unique: true
    add_index :products, :sku, unique: true
  end
end
