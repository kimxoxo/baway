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

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :surname, :role
  # attr_accessible :title, :body


  has_many :budgets, foreign_key: :arquitect_id, dependent: :destroy



  #attr_accessible :email, :encrypted_password, :landline, :mobile, :name, :role, :surname

  #has_many :budgets


  validates :name, :surname, :role,
    	presence: true

end
