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
    Mark.all.order(:priority).where('(priority%2)=0 and (hidden is null or hidden = 0) and priority<=20')
  end

  def marcas_posicion_impar
    Mark.all.order(:priority).where('(priority%2)!=0 and (hidden is null or hidden = 0) and priority<20')
  end
  
end
