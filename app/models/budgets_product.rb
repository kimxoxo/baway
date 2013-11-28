# == Schema Information
#
# Table name: budgets_products
#
#  id         :integer          not null, primary key
#  budget_id  :integer
#  product_id :integer
#  quantity   :integer
#  markup     :float
#

class BudgetsProduct < ActiveRecord::Base
	attr_accessible :quantity, :house_area



  belongs_to :budget
  belongs_to :product
end
