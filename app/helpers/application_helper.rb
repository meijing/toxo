module ApplicationHelper

  def error_messages_for models
     if models.errors.any?
        content_tag :div, id: "error_explanation" do
          content_tag(:ul) do
            models.errors.full_messages.map do |msg|
              content_tag :li, msg
            end.join.html_safe
          end
        end
     end
  end

  def set_params(category_id, product_type_id, mark_id)
    session[:category_id] = category_id
    session[:product_type_id] = product_type_id
    session[:mark_id] = mark_id
  end

  def marcas_posicion_par
    @num_marks_hidden = Mark.where('(priority%2)=0 and (hidden is null or hidden = 0) and priority<=7').count
    @num_marks_to_show = (7+@num_marks_hidden)*2
    Mark.all.order(:priority).where('(priority%2)=0 and (hidden is null or hidden = 0) and priority<=?',@num_marks_to_show)
  end

  def marcas_posicion_impar
    @num_marks_hidden = Mark.where('(priority%2)!=0 and (hidden is null or hidden = 0) and priority<7').count
    @num_marks_to_show = (7+@num_marks_hidden)*2
    Mark.all.order(:priority).where('(priority%2)!=0 and (hidden is null or hidden = 0) and priority<?', @num_marks_to_show)
  end
  
end
