# == Schema Information
#
# Table name: requests
#
#  id             :integer          not null, primary key
#  budget_id      :integer
#  request_number :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Request < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :budget

	has_many :budgets_products
  has_many :products, through: :budgets_products

	validate :request_is_valid


  def request_is_valid

  	budget = Budget.find(self.budget_id) 

    #has at least one payment condition
    if budget.payment_conditions.find_all_by_active(true).count == 0
    	errors.add(:id, "selecione um metodo de pagamento!")
    end

		if budget.budgets_products.where(active: !nil).where("request_id IS NULL").count == 0
			errors.add(:id, "selecione pelo menos 1 item!")
		end


    #validates customer
    if budget.customer.name.blank?
    	errors.add(:id, "preencha nome cliente!")
    end

    if budget.customer.tax_number.blank?
    	errors.add(:id, "preencha cpf/cnpj!")
    end

    if budget.customer.street_number.blank?
    	errors.add(:id, "preencha numero da rua do cliente!")
    end

    if budget.customer.postal_code.blank?
    	errors.add(:id, "preencha cep do cliente!")
    end

    if budget.customer.city.blank?
    	errors.add(:id, "preencha cidade do cliente!")
    end

    if budget.customer.street.blank?
    	errors.add(:id, "preencha endereco do cliente!")
    end

    if budget.customer.mobile.blank?
    	errors.add(:id, "preencha celular do cliente!")
    end

    if budget.customer.neighbourhood.blank?
    	errors.add(:id, "preencha bairro do cliente!")
    end

  end



end