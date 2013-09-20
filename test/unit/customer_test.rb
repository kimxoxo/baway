# == Schema Information
#
# Table name: customers
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  street             :string(255)
#  street_number      :integer
#  tax_number         :string(255)
#  neighbourhood      :string(255)
#  postal_code        :string(255)
#  address_complement :string(255)
#  tax_number_type    :integer
#  landline           :string(255)
#  mobile             :string(255)
#  city               :string(255)
#  rg                 :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
