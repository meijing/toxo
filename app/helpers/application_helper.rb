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
    @num_marks_hidden = Mark.where('(priority%2)=0 and (hidden =1) and priority<=12').count
    @num_marks_to_show = (6+@num_marks_hidden)*2
    Mark.all.order(:priority).where('(priority%2)=0 and (hidden is null or hidden = 0) and priority<=?',@num_marks_to_show)
  end

  def marcas_posicion_impar
    @num_marks_hidden = Mark.where('(priority%2)!=0 and (hidden = 1) and priority<12').count
    @num_marks_to_show = (6+@num_marks_hidden)*2
    Mark.all.order(:priority).where('(priority%2)!=0 and (hidden is null or hidden = 0) and priority<?', @num_marks_to_show)
  end

  def list_sales
    @tree = Array.new
    Category.all.each do |ctp|
      @category_product_type = CategoryProductType.joins('join products p on p.product_type_id = category_product_types.product_type_id').
        where('category_product_types.category_id = ? and category_product_types.sale = ?', ctp.id, 1).uniq
      if !@category_product_type.empty?
        @product_types = Array.new
        @category_product_type.each do |relation|
          @product_types << ProductType.find(relation.product_type_id)
        end
        @tree << [ctp,@product_types]
      end
    end
    @tree
  end
  
end
