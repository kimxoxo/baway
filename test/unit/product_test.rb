# == Schema Information
#
# Table name: products
#
#  id                      :integer          not null, primary key
#  supplier_id             :integer
#  description             :text
#  brand                   :string(255)
#  code                    :string(255)
#  supplier_price          :decimal(, )
#  ipi                     :decimal(, )
#  ncm                     :integer
#  width                   :decimal(, )
#  product_type            :integer
#  markup                  :decimal(, )
#  supplier_table_discount :decimal(, )
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  visible                 :boolean
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
