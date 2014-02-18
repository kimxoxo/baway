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
	attr_accessible :quantity, :house_area, :days_to_delivery, :freight, :height, :width,
									:product_observations, :active, :budget_status_dont_change


	attr_accessor :budget_status_dont_change


  belongs_to :budget
  belongs_to :product
  belongs_to :request


end