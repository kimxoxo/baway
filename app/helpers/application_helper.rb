module ApplicationHelper



  def filter_list_not_present
    if (params[:action] == 'new' || params[:action] == 'edit' || params[:action] == 'show' || params[:action] == 'update' || params[:action] == 'create' || params[:action] == 'new_architect' || params[:action] == 'create_architect' || params[:action] == 'edit_architect')
      not_present = true

    else
      not_present = false

    end

    return not_present
  end



	def is_numeric?(string)
	  true if Float(string) rescue false
	end





	def units_collection
		
		options = ({(t :"activerecord.attributes.product.unit1") => 1, (t :"activerecord.attributes.product.unit2") => 2, (t :"activerecord.attributes.product.unit3") => 3, (t :"activerecord.attributes.product.unit4") => 4})

	end


end