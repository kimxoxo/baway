class ChangeQuantityToDecimal < ActiveRecord::Migration
	def up
	    change_column :budgets_products, :quantity, :decimal
	end
	
	def down
	    change_column :budgets_products, :quantity, :integer
	end
end
