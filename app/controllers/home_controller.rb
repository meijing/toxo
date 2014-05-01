class HomeController < ApplicationController

  def home
    @products = Product.all
  end

  def who_are

  end

  def products

    if !params[:mark_id].nil? and !params[:category_id].nil?
      @mark = Mark.find(params[:mark_id])
      @category = Category.find(params[:category_id])
      @products = Product.where('mark_id = ? and category_id = ?', @mark.id, @category.id)
    end

    if !params[:mark_id].nil? and params[:product_type_id].nil?
      @mark = Mark.find(params[:mark_id])
      @products = Product.where('mark_id = ?', @mark.id)
    end

    if !params[:mark_id].nil? and !params[:product_type_id].nil?
      @mark = Mark.find(params[:mark_id])
      @product_type = ProductType.find(params[:product_type_id])
      @products = Product.where('mark_id = ? and product_type_id = ?', @mark.id, @product_type.id)
    end

    if !params[:category_id].nil? and !params[:product_type_id].nil?
      @category = Category.find(params[:category_id])
      @product_type = ProductType.find(params[:product_type_id])
      @products = Product.where('category_id = ? and product_type_id = ?', @category.id, @product_type.id)
    end

    if !params[:category_id].nil? and params[:product_type_id].nil?
      @category = Category.find(params[:category_id])
      @products = Product.where('category_id = ?', @category.id)
    end
  end
end
