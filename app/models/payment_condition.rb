# == Schema Information
#
# Table name: payment_conditions
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  discount             :float
#  num_monthly_payments :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class PaymentCondition < ActiveRecord::Base
  attr_accessible :discount, :name, :num_monthly_payments


  belongs_to :budget

end
