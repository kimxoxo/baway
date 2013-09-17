# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  supplier_id    :string(255)
#  description    :text
#  brand          :string(255)
#  code           :string(255)
#  supplier_price :decimal(, )
#  ipi            :decimal(, )
#  ncm            :integer
#  width          :decimal(, )
#  um             :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Product < ActiveRecord::Base
  attr_accessible :brand, :code, :description, :ipi, :ncm, :supplier_id, :supplier_price, :um, :width

  belongs_to :budget
  belongs_to :supplier

end
