module ProductTypesHelper

  def has_relation (category_id, product_type_id)
    @relation = CategoryProductType.where('category_id = ? and product_type_id = ?', category_id, product_type_id)

    if @relation.nil? or @relation.length == 0
      return false
    end
    return true
  end

  def is_for_sale(product_type_id, category_id)
    @cpt = CategoryProductType.where('product_type_id = ? and category_id = ?', product_type_id, category_id)

    if @cpt.length > 0 && @cpt[0].sale==1
      return true
    end
    return false
  end

end
