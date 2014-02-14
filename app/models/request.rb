class Request < ActiveRecord::Base
  # attr_accessible :title, :body


	has_many :budgets_products

end
