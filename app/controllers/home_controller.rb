class HomeController < ApplicationController
  respond_to :html, :xml, :json
  def home
    @images = ImageHome.all
    @textos = Texto.first
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
      @products = Product.joins(:mark).where('(outlet is null or outlet = 0) and marks.hidden = 0 and mark_id = ? and product_type_id = ? and category_id=?', @mark.id, @product_type.id, @category.id).order('marks.name, products.name')
    end
    
    if !params[:mark_id].nil? and !params[:category_id].nil? and params[:product_type_id].nil?
      @mark = Mark.find(params[:mark_id])
      @category = Category.find(params[:category_id])
      @products = Product.joins(:mark).where('(outlet is null or outlet = 0) and marks.hidden = 0 and mark_id = ? and category_id = ?', @mark.id, @category.id).order('marks.name, products.name')
    end

    if !params[:mark_id].nil? and params[:product_type_id].nil? and params[:category_id].nil?
      @mark = Mark.find(params[:mark_id])
      @products = Product.joins(:mark).where('(outlet is null or outlet = 0) and marks.hidden = 0 and mark_id = ?', @mark.id).order('marks.name, products.name')
    end

    if !params[:mark_id].nil? and !params[:product_type_id].nil? and params[:category_id].nil?
      @mark = Mark.find(params[:mark_id])
      @product_type = ProductType.find(params[:product_type_id])
      @products = Product.joins(:mark).where('(outlet is null or outlet = 0) and marks.hidden = 0 and mark_id = ? and product_type_id = ?', @mark.id, @product_type.id).order('marks.name, products.name')
    end

    if !params[:category_id].nil? and !params[:product_type_id].nil? and params[:mark_id].nil?
      @category = Category.find(params[:category_id])
      @product_type = ProductType.find(params[:product_type_id])
      @products = Product.joins(:mark).where('(outlet is null or outlet = 0) and marks.hidden = 0 and category_id = ? and product_type_id = ?', @category.id, @product_type.id).order('marks.name, products.name')
    end

    if !params[:category_id].nil? and params[:product_type_id].nil? and params[:mark_id].nil?
      @category = Category.find(params[:category_id])
      @products = Product.joins(:mark).where('(outlet is null or outlet = 0) and marks.hidden = 0 and category_id = ?', @category.id).order('marks.name, products.name')
    end
  end

  def outletBack
    @products = Product.get_all_products_outlet
  end

  def sales
    @pt_id = params[:product_type_id]
    @cat_id = params[:category_id]
    if !@cat_id.nil?
      @products = Product.where('sale = ? and (outlet is null or outlet = 0) and (? is null or product_type_id=?) and category_id = ?  and (new_collection is null or new_collection = 0)', 1, @pt_id, @pt_id, @cat_id).order(:name)
    else
      @products = Product.where('sale = ? and (outlet is null or outlet = 0) and (new_collection is null or new_collection = 0)', 1).order(:name).sample(15)
    end
  end

  def image_zoom
    @product = Product.find(params[:product_id])
  end

  def google6c3e7b71e5e6c093
    
  end
  
  def politica_cookies
  
  end
  
  def outlet
    @nameCategoriesOutlet = Category.select('name, 1 as tipo').joins('join config_outlets cf on cf.category_id = categories.id')
    @nameCategoriesOutlet = @nameCategoriesOutlet + (ProductType.select('name, 2 as tipo').joins('join config_outlets cf on cf.product_type_id = product_types.id'))
    
    @typeproduct = params[:type]
    @typeproductname = params[:name_type]

    @products = []
    if @typeproduct.nil?
      @desctypeproduct = 'OUTLET'
    else
      @desctypeproduct = 'OUTLET ' + @typeproductname.upcase
    end
    
    @products = Product.get_all_products_outlet_cambiado(@typeproduct, @typeproductname)
  end

end
