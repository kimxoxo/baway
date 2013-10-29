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
#  quantity       :integer
#

class Product < ActiveRecord::Base
  attr_accessible :brand, :code, :description, :ipi, :ncm, :supplier_id, :supplier_price, :um, :width


	attr_accessor :search_phrase, :budget_id

	has_and_belongs_to_many :budgets

  belongs_to :supplier

end
