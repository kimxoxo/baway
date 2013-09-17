# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  surname            :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#  landline           :string(255)
#  mobile             :string(255)
#  role               :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :encrypted_password, :landline, :mobile, :name, :role, :surname

  belongs_to :budget

end
