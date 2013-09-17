# == Schema Information
#
# Table name: suppliers
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  street             :string(255)
#  street_number      :string(255)
#  neighbourhood      :string(255)
#  city               :string(255)
#  address_complement :string(255)
#  cnpj               :string(255)
#  postal_code        :string(255)
#  landline           :string(255)
#  cellphone          :string(255)
#  ie                 :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Supplier < ActiveRecord::Base
  attr_accessible :address_complement, :mobile, :city, :cnpj, :ie, :landline, :name, :neighbourhood, :postal_code, :street, :street_number

  has_many :products

end