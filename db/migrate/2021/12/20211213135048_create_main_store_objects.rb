class CreateMainStoreObjects < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
    end

    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.string :sku, null: false
      t.decimal :weight, precision: 8, scale: 2
      t.decimal :height, precision: 8, scale: 2
      t.decimal :width, precision: 8, scale: 2
      t.decimal :depth, precision: 8, scale: 2
      t.boolean :is_main, default: false
      t.decimal :cost_price, precision: 10, scale: 2
      t.integer :position
      t.references :tax_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
