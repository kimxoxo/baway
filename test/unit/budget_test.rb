# == Schema Information
#
# Table name: budgets
#
#  id                       :integer          not null, primary key
#  customer_id              :integer
#  status                   :integer
#  seller_id                :integer
#  architect_id             :integer
#  observations             :text
#  instalation_observations :text
#  discount                 :decimal(, )
#  freight                  :boolean
#  instalation              :boolean
#  initial_payment          :decimal(, )
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  deleted                  :boolean
#  instant_payment          :boolean
#  instant_payment_discount :decimal(, )
#

require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
