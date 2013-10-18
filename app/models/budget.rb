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

class Budget < ActiveRecord::Base
  attr_accessible :arquitect_id, :customer_id, :description, :payment_condition_id,
  				  :seller_id, :status, :customer_attributes


  has_many :products

  has_many :users

  has_one  :payment_condition

  belongs_to :customer

  accepts_nested_attributes_for :customer


	#validates :description,
    	#presence: true

end