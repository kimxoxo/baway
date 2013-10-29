class BudgetsProduct < ActiveRecord::Base
	attr_accessible :quantity, :markup



  belongs_to :budget
  belongs_to :product
end