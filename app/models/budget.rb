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
  				  :seller_id, :status, :customer_attributes, :markup, :user



  #this is similar to has_and_belongs_to_many
  #this way we can use extra attributes in the budgets_products
  has_many :budgets_products
  has_many :products, through: :budgets_products



  belongs_to :user, foreign_key: :arquitect_id

  has_one  :payment_condition

  belongs_to :customer

  accepts_nested_attributes_for :customer


  attr_accessor :user

	
  validates :arquitect_id,
      presence: true


  validates :markup,
      presence: true,
      numericality: { greater_than: 0, less_than_or_equal_to: 100 }

end