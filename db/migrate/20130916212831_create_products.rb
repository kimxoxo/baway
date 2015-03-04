class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :supplier_id
      t.text :description
      t.string :brand
      t.string :code
      t.decimal :supplier_price
      t.decimal :ipi
      t.integer :ncm
      t.decimal :width
      t.integer :product_type
      t.decimal :markup
      t.decimal :supplier_table_discount

      t.timestamps
    end
  end
end
