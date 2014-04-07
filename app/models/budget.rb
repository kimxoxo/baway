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

class Budget < ActiveRecord::Base
  attr_accessible :architect_id, :customer_id, :description, :payment_condition_id,
  				  			:seller_id, :status, :customer_attributes, :user, :discount, :freight,
  				  			:instalation, :instalation_observations, :payment_condition, :initial_payment,
  				  			:observations, :deleted, :instant_payment, :instant_payment_discount


  #this is similar to has_and_belongs_to_many
  #this way we can use extra attributes in the budgets_products
  has_many :budgets_products
  has_many :products, through: :budgets_products

  has_many :requests

  belongs_to :user, foreign_key: :architect_id

  has_many  :payment_conditions

  belongs_to :customer

  accepts_nested_attributes_for :customer


  attr_accessor :user, :payment_condition

	
  validates :architect_id,
      presence: true


  #validates :markup,
      #presence: true,
      #numericality: { greater_than: 0, less_than_or_equal_to: 100 }





  validate :budget_is_valid_status1to2

  #validate :budget_is_valid_status2to3



  def budget_is_valid_status1to2
    
		if self.status == 2

		    self.budgets_products.each do |bp|
		      if bp.house_area.blank?
		        self.errors.add(:id, "")
		      end

		      if bp.quantity.nil?
		        self.errors.add(:id, "")
		      end

		      if bp.freight.nil?
		        self.errors.add(:id, "")
		      end

		      if bp.days_to_delivery.nil?
		        self.errors.add(:id, "")
		      end

		    end

			  #has at least one product
			  if self.budgets_products.count == 0
			   	self.errors.add(:id, "")
			  end

		end

  end

end
