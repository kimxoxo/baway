# == Schema Information
#
# Table name: customers
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
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

class Customer < ActiveRecord::Base
  attr_accessible :address_complement, :mobile, :city, :landline, :name,
  				  :neighbourhood, :postal_code, :rg, :street, :street_number,
  				  :tax_number, :tax_number_type, :email

  has_many :budgets


	validates :name, :mobile, :email,
    	presence: true



	#validates_presence_of :name, :street, :street_number, :postal_code, :city, :mobile, :tax_number, :neighbourhood,
    	 #:if => Proc.new { |c| !Budget.find_by_customer_id(c.id).nil? &&  Budget.find_by_customer_id(c.id).status == 2 }



  #validates_length_of :tax_number, is: 14, :if => Proc.new { |c| c.tax_number_type == 1 }
  #validates_length_of :tax_number, is: 18, :if => Proc.new { |c| c.tax_number_type == 2 }






end
