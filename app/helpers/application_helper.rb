module ApplicationHelper





  def filter_list_not_present
    if (params[:action] == 'new' || params[:action] == 'edit' || params[:action] == 'show' || params[:action] == 'edit_user_from_newuser_ticket')
      not_present = true

    else
      not_present = false

    end

    return not_present
  end

end
