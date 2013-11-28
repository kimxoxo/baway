module ApplicationHelper



  def filter_list_not_present
    if (params[:action] == 'new' || params[:action] == 'edit' || params[:action] == 'show' || params[:action] == 'update' || params[:action] == 'create' || params[:action] == 'new_architect' || params[:action] == 'create_architect')
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
