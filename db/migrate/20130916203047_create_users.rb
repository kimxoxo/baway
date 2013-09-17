class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :encrypted_password
      t.string :landline
      t.string :mobile
      t.integer :role

      t.timestamps
    end
  end
end
