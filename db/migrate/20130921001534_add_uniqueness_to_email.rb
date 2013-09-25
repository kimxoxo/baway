class AddUniquenessToEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    add_index :customers, :email, unique: true
    add_index :customers, :tax_number, unique: true
  end
end
