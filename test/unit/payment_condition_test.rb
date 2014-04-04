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

require 'test_helper'

class PaymentConditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
