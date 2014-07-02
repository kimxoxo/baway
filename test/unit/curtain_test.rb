# == Schema Information
#
# Table name: curtains
#
#  id                  :integer          not null, primary key
#  budgets_product_id  :integer
#  window_width        :decimal(, )
#  window_height       :decimal(, )
#  window_number_parts :integer
#  wave_factor         :integer
#  fabric_width        :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class CurtainTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
