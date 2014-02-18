class Request < ActiveRecord::Base
  # attr_accessible :title, :body


	has_many :budgets_products

	validate :request_is_valid


  def request_is_valid


  	budget = Budget.find(self.budget_id) 

    #has at least one payment condition
    if budget.payment_conditions.find_all_by_active(true).count == 0
    	errors.add(:id, "")
    end

		if budget.budgets_products.where(active: !nil).where("request_id IS NULL").count == 0
			errors.add(:id, "")
		end


    #validates customer
    if budget.customer.name.blank?
    	errors.add(:id, "")
    end

    if budget.customer.tax_number.blank?
    	errors.add(:id, "")
    end

    if budget.customer.street_number.blank?
    	errors.add(:id, "")
    end

    if budget.customer.postal_code.blank?
    	errors.add(:id, "")
    end

    if budget.customer.city.blank?
    	errors.add(:id, "")
    end

    if budget.customer.city.blank?
    	errors.add(:id, "")
    end

    if budget.customer.mobile.blank?
    	errors.add(:id, "")
    end

    if budget.customer.neighbourhood.blank?
    	errors.add(:id, "")
    end

  end




end
