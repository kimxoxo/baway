# == Schema Information
#
# Table name: payment_conditions
#
#  id                   :integer          not null, primary key
#  budget_id            :integer
#  num_monthly_payments :integer
#  active               :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class PaymentCondition < ActiveRecord::Base
  attr_accessible :budget_id, :discount, :name, :num_monthly_payments, :active


  belongs_to :budget

end
