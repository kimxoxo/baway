# == Schema Information
#
# Table name: curtains
#
#  id                  :integer          not null, primary key
#  window_width        :decimal(, )
#  window_height       :decimal(, )
#  window_number_parts :integer
#  wave_factor         :integer
#  fabric_width        :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Curtain < ActiveRecord::Base

	attr_accessible :window_width, :window_height, :window_number_parts, :wave_factor,
									:fabric_width


	belongs_to :budgets_product


end
