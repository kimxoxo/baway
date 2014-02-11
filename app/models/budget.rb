# == Schema Information
#
# Table name: budgets
#
#  id                   :integer          not null, primary key
#  customer_id          :integer
#  status               :integer
#  seller_id            :integer
#  architect_id         :integer
#  payment_condition_id :integer
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  markup               :float
#

class Budget < ActiveRecord::Base
  attr_accessible :architect_id, :customer_id, :description, :payment_condition_id,
  				  			:seller_id, :status, :customer_attributes, :user, :discount, :freight,
  				  			:instalation, :instalation_observations, :payment_condition, :initial_payment,
  				  			:observations


  #this is similar to has_and_belongs_to_many
  #this way we can use extra attributes in the budgets_products
  has_many :budgets_products
  has_many :products, through: :budgets_products



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

  validate :budget_is_valid_status2to3



  def budget_is_valid_status1to2
    

if self.status == 2

    self.budgets_products.each do |bp|
      if bp.house_area.blank?
        errors.add(:house_area, "")
      end

      if bp.quantity.nil?
        errors.add(:quantity, "")
      end

      if bp.freight.nil?
        errors.add(:freight, "")
      end

      if bp.days_to_delivery.nil?
        errors.add(:days_to_delivery, "")
      end

    end

	  #has at least one product
	  if self.budgets_products.count == 0
	   	self.errors.add(:id, "")
	  end

end


  end






  def budget_is_valid_status2to3

if self.status == 3


    #has at least one payment condition
    if self.payment_conditions.find_all_by_active(true).count == 0
    	self.errors.add(:id, "")
    end

    #validates customer
    if self.customer.name.blank?
    	self.errors.add(:id, "")
    end

    if self.customer.tax_number.blank?
    	self.errors.add(:id, "")
    end

    if self.customer.street_number.blank?
    	self.errors.add(:id, "")
    end

    if self.customer.postal_code.blank?
    	self.errors.add(:id, "")
    end

    if self.customer.city.blank?
    	self.errors.add(:id, "")
    end

    if self.customer.city.blank?
    	self.errors.add(:id, "")
    end

    if self.customer.mobile.blank?
    	self.errors.add(:id, "")
    end

    if self.customer.neighbourhood.blank?
    	self.errors.add(:id, "")
    end

end

  end









end
