class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|

    	t.integer :budget_id
    	t.decimal :request_number
      t.timestamps
    end
  end
end
