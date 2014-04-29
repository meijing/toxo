module ProductTypesHelper

    def has_relation (category_id, product_type_id)
    @relation = CategoryProductType.where('category_id = ? and product_type_id = ?', category_id, product_type_id)

    if @relation.nil? or @relation.length == 0
      return false
    end
    return true
  end


end
