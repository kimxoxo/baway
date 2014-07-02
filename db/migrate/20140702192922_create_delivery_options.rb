class CreateDeliveryOptions < ActiveRecord::Migration
  def change
    create_table :delivery_options do |t|
      t.integer :budget_id
      t.string  :name
      t.boolean :option1
      t.string  :option1_label
			t.boolean :option2
      t.string  :option2_label
			t.boolean :option3
      t.string  :option3_label
			t.boolean :option4
      t.string  :option4_label
			t.text    :observations

      t.timestamps
    end
  end
end
