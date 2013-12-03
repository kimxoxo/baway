class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :customer_id
      t.integer :status
      t.integer :seller_id
      t.integer :architect_id
      t.integer :payment_condition_id
      t.text    :observations
      t.text    :instalation_observations      
      t.decimal :discount
      t.boolean :freight
      t.boolean :instalation

      t.timestamps
    end
  end
end
