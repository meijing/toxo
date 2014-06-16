class HomeController < ApplicationController

  def home
    @products = Product.find(:all).sample(15)
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
    @promo_catalog = params[:promo_catalog]
    @products = Product.is_promotion(@promo_catalog)

    @promotions = Promotion.is_active
  end

  def products

    if !params[:mark_id].nil? and !params[:product_type_id].nil? and !params[:category_id].nil?
      @mark = Mark.find(params[:mark_id])
      @product_type = ProductType.find(params[:product_type_id])
      @category = Category.find(params[:category_id])
      @products = Product.where('mark_id = ? and product_type_id = ? and category_id=?', @mark.id, @product_type.id, @category.id)
    end
    
    if !params[:mark_id].nil? and !params[:category_id].nil? and params[:product_type_id].nil?
      @mark = Mark.find(params[:mark_id])
      @category = Category.find(params[:category_id])
      @products = Product.where('mark_id = ? and category_id = ?', @mark.id, @category.id)
    end

    if !params[:mark_id].nil? and params[:product_type_id].nil? and params[:category_id].nil?
      @mark = Mark.find(params[:mark_id])
      @products = Product.where('mark_id = ?', @mark.id)
    end

    if !params[:mark_id].nil? and !params[:product_type_id].nil? and params[:category_id].nil?
      @mark = Mark.find(params[:mark_id])
      @product_type = ProductType.find(params[:product_type_id])
      @products = Product.where('mark_id = ? and product_type_id = ?', @mark.id, @product_type.id)
    end

    if !params[:category_id].nil? and !params[:product_type_id].nil? and params[:mark_id].nil?
      @category = Category.find(params[:category_id])
      @product_type = ProductType.find(params[:product_type_id])
      @products = Product.where('category_id = ? and product_type_id = ?', @category.id, @product_type.id)
    end

    if !params[:category_id].nil? and params[:product_type_id].nil? and params[:mark_id].nil?
      @category = Category.find(params[:category_id])
      @products = Product.where('category_id = ?', @category.id)
    end
  end

  def outlet
    @products = Product.get_all_products_outlet
  end
end
