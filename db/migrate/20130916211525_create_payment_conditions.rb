class CreatePaymentConditions < ActiveRecord::Migration
  def change
    create_table :payment_conditions do |t|
    	t.integer :budget_id
      t.integer :num_monthly_payments
      t.boolean :active

      t.timestamps
    end
  end
end
