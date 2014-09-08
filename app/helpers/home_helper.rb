module HomeHelper

  def find_categories(mark, category, product_type)
    if !mark.nil?
      @mark_id = mark.id
    else
      @mark_id = nil
    end

    if !category.nil?
      @category_id = category.id
    else
      @category_id = nil
    end

    if !product_type.nil?
      @product_type_id = product_type.id
    else
      @product_type_id = nil
    end
    @categories = Category.find_categories(@mark_id, @category_id, @product_type_id)
  end

  def find_product_types(mark, category, product_type)
    if !mark.nil?
      @mark_id = mark.id
    else
      @mark_id = nil
    end

    if !category.nil?
      @category_id = category.id
    else
      @category_id = nil
    end

    if !product_type.nil?
      @product_type_id = product_type.id
    else
      @product_type_id = nil
    end
    ProductType.find_product_types(@mark_id, @category_id, @product_type_id)
  end

  def get_mark_id mark
    if mark.nil?
      return nil
    else
      return mark.id
    end
  end

  def get_mark_name mark
    if mark.nil?
      return ''
    else
      return '_'+mark.name
    end
  end
end
