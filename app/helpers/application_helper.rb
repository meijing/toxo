module ApplicationHelper

  def get_title meta_title
    if meta_title.nil? || meta_title == ''
      return 'Toxo | Bolsos y complementos Santiago de Compostela y Vigo'
    end
    return meta_title
  end

  def create_title(product_type, category, mark)
    @title = 'Toxo | '
    if !product_type.nil?
      @title = @title.concat(product_type.name).concat(' ')
    end
    if !category.nil?
      @title = @title.concat(category.name).concat(' ')
    end
    if !mark.nil?
      @title = @title.concat(mark.name).concat(' ')
    end
    @title
  end

  def get_description meta_description
    if meta_description.nil? || meta_description == ''
      return 'Venta de bolsos de piel, ecopiel y de fibra de señora y caballero, artículos de viaje, billeteras, cinturones, pashminas y regalo en general. Estamos en Santiago de Compostela y en Vigo'
    end
    return meta_description
  end

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
