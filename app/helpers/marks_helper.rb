module MarksHelper

  def checked(cat_id, pt_id, product_types_associated)
    product_types_associated.each do |pta|
      if pta.product_type_id == pt_id and pta.category_id == cat_id
        return true
      end
    end
    return false
  end
end
