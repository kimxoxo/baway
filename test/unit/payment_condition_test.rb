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

require 'test_helper'

class PaymentConditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
