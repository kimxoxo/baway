# == Schema Information
#
# Table name: budgets_products
#
#  id                   :integer          not null, primary key
#  budget_id            :integer
#  product_id           :integer
#  house_area           :string(255)
#  quantity             :decimal(, )
#  days_to_delivery     :integer
#  freight              :decimal(, )
#  height               :decimal(, )
#  width                :decimal(, )
#  active               :boolean
#  request_id           :integer
#  computed_price       :decimal(, )
#  product_observations :string(255)
#  product_type         :integer
#

class BudgetsProduct < ActiveRecord::Base
	attr_accessible :quantity, :house_area, :days_to_delivery, :freight, :height, :width,
									:product_observations, :active, :budget_status_dont_change,
									:product_type, :computed_price, :up, :show


	attr_accessor :budget_status_dont_change


  belongs_to :budget
  belongs_to :product
  belongs_to :request

  has_one :curtain


end
