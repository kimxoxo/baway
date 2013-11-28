class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :customer_id
      t.integer :status
      t.integer :seller_id
      t.integer :architect_id
      t.integer :payment_condition_id
      t.text    :description
      t.decimal :discount

      t.timestamps
    end
  end
end
