# == Schema Information
#
# Table name: budgets
#
#  id                   :integer          not null, primary key
#  customer_id          :integer
#  status               :integer
#  seller_id            :integer
#  arquitect_id         :integer
#  payment_condition_id :integer
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
