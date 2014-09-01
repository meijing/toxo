class HomeController < ApplicationController

  def home
    @images = ImageHome.all
  end

  def who_are

  end

  def our_marks

  end

  def all_products
    
  end

  def promotions
    @promotions = Promotion.is_active
  end

  def show_promotion
    @promo = Promotion.find(params[:id])
    @products = Product.where('(outlet is null or outlet = 0)').is_promotion(@promo.id)

    @promotions = Promotion.is_active.limit(10)
  end
  
  def products

    if !params[:mark_id].nil? and !params[:product_type_id].nil? and !params[:category_id].nil?
      @mark = Mark.find(params[:mark_id])
      @product_type = ProductType.find(params[:product_type_id])
      @category = Category.find(params[:category_id])
      @products = Product.where('(outlet is null or outlet = 0) and mark_id = ? and product_type_id = ? and category_id=?', @mark.id, @product_type.id, @category.id)
    end
    
    if !params[:mark_id].nil? and !params[:category_id].nil? and params[:product_type_id].nil?
      @mark = Mark.find(params[:mark_id])
      @category = Category.find(params[:category_id])
      @products = Product.where('(outlet is null or outlet = 0) and mark_id = ? and category_id = ?', @mark.id, @category.id)
    end

    if !params[:mark_id].nil? and params[:product_type_id].nil? and params[:category_id].nil?
      @mark = Mark.find(params[:mark_id])
      @products = Product.where('(outlet is null or outlet = 0) and mark_id = ?', @mark.id)
    end

    if !params[:mark_id].nil? and !params[:product_type_id].nil? and params[:category_id].nil?
      @mark = Mark.find(params[:mark_id])
      @product_type = ProductType.find(params[:product_type_id])
      @products = Product.where('(outlet is null or outlet = 0) and mark_id = ? and product_type_id = ?', @mark.id, @product_type.id)
    end

    if !params[:category_id].nil? and !params[:product_type_id].nil? and params[:mark_id].nil?
      @category = Category.find(params[:category_id])
      @product_type = ProductType.find(params[:product_type_id])
      @products = Product.where('(outlet is null or outlet = 0) and category_id = ? and product_type_id = ?', @category.id, @product_type.id)
    end

    if !params[:category_id].nil? and params[:product_type_id].nil? and params[:mark_id].nil?
      @category = Category.find(params[:category_id])
      @products = Product.where('(outlet is null or outlet = 0) and category_id = ?', @category.id)
    end
  end

  def outlet
    @products = Product.get_all_products_outlet
  end

  def sales
    @pt_id = params[:product_type_id]
    @cat_id = params[:category_id]
    if !@cat_id.nil?
      @products = Product.where('sale = ? and (outlet is null or outlet = 0) and (? is null or product_type_id=?) and category_id = ?  and (new_collection is null or new_collection = 0)', 1, @pt_id, @pt_id, @cat_id)
    else
      @products = Product.where('sale = ? and (outlet is null or outlet = 0) and (new_collection is null or new_collection = 0)', 1).sample(15)
    end
  end

end
