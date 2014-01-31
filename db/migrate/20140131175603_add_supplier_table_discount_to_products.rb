class AddSupplierTableDiscountToProducts < ActiveRecord::Migration
  def up
  	add_column :products, :supplier_table_discount, :decimal
  end

  def down
  	add_column :products, :supplier_table_discount, :decimal
  end
end
