# == Schema Information
#
# Table name: delivery_options
#
#  id            :integer          not null, primary key
#  budget_id     :integer
#  name          :string(255)
#  option1       :boolean
#  option1_label :string(255)
#  option2       :boolean
#  option2_label :string(255)
#  option3       :boolean
#  option3_label :string(255)
#  option4       :boolean
#  option4_label :string(255)
#  observations  :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class DeliveryOption < ActiveRecord::Base
  attr_accessible :budget_id, :name, :option1, :option1_label, :option2, :option2_label,
  								:option3, :option3_label, :option4, :option4_label, :observations


  belongs_to :budget

end
