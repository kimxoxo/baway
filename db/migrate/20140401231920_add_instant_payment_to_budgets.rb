class AddInstantPaymentToBudgets < ActiveRecord::Migration
  def up
  	add_column :budgets, :instant_payment, :boolean
  	add_column :budgets, :instant_payment_discount, :decimal  	
  end

  def down
  	remove_column :budgets, :instant_payment, :boolean
  	remove_column :budgets, :instant_payment_discount, :decimal  	  	
  end
end