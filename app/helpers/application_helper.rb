module ApplicationHelper



  def filter_list_not_present
    if (params[:action] == 'new' || params[:action] == 'edit' || params[:action] == 'show' || params[:action] == 'update' || params[:action] == 'create')
      not_present = true

    else
      not_present = false

    end

    return not_present
  end



	def is_numeric?(string)
	  true if Float(string) rescue false
	end


end
