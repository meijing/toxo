module ProductsHelper

  def show_product_in_promotion product
    Promotion.is_active.each do |promotion|
      if !promotion.catalog.nil? && promotion.catalog != '' &&
          promotion.catalog == product.name
        return true
      end

      if !promotion.mark_id.nil? &&
          promotion.mark_id == product.mark_id
        return true
      end

      if !promotion.product_type_id.nil? &&
          !promotion.category_type_id.nil? &&
          promotion.product_type_id == product.product_type_id &&
          promotion.category_type_id == product.category_id
        return true
      end
    end
    return false
  end
end
