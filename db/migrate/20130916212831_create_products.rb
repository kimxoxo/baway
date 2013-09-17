class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :supplier_id
      t.text :description
      t.string :brand
      t.string :code
      t.decimal :supplier_price
      t.decimal :ipi
      t.integer :ncm
      t.decimal :width
      t.boolean :um

      t.timestamps
    end
  end
end
