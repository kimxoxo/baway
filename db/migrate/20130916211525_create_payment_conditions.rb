class CreatePaymentConditions < ActiveRecord::Migration
  def change
    create_table :payment_conditions do |t|
    	t.integer :budget_id
      t.string  :name
      t.float   :discount
      t.integer :num_monthly_payments

      t.timestamps
    end
  end
end
