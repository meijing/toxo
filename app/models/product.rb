class Product < ActiveRecord::Base
  has_attached_file :image, styles: {original: '600x450', medium: '200x200>', thumb: '48x48>' }, :default_url => "/images/thumb/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :mark

  scope :is_promotion, lambda {|id|
    @promo = Promotion.find(id)
    if !@promo.nil? and @promo.catalog != ''
      where('upper(name) = ?', @promo.catalog.upcase)
    elsif !@promo.nil? and !@promo.mark_id.nil?
      where('mark_id = ?', @promo.mark_id)
    elsif !@promo.nil? and !@promo.product_type_id.nil? and !@promo.category_type_id.nil?
      where('product_type_id = ? and category_id = ?', @promo.product_type_id, @promo.category_type_id)
    end
  }

  def self.exists_products_outlet
    if Product.where('outlet =1').length > 0
      return true
    end
    return false
  end

  def self.get_all_products_outlet
    Product.where('outlet=1')
  end
  
  def self.get_all_products_outlet_cambiado(type, typename)
    if type == '1' then
      Product.joins('join mark_product_types mpt on mpt.product_type_id = products.product_type_id and mpt.mark_id = products.mark_id and products.category_id = mpt.category_id').joins('join category_product_types cpt on cpt.product_type_id = mpt.product_type_id and cpt.category_id = products.category_id').joins('join categories cat on cat.id = cpt.category_id').joins('join marks m on m.id = mpt.mark_id').where('products.outlet=1 and cat.name like ?', typename).order('m.name, products.name').in_groups_of(3)
    elsif type == '2' then
      Product.joins('join mark_product_types mpt on mpt.product_type_id = products.product_type_id and mpt.mark_id = products.mark_id and products.category_id = mpt.category_id').joins('join category_product_types cpt on cpt.product_type_id = mpt.product_type_id and cpt.category_id = products.category_id').joins('join product_types pt on pt.id = products.product_type_id').joins('join marks m on m.id = mpt.mark_id').where('products.outlet=1 and pt.name like ?', typename).order('m.name, products.name').in_groups_of(3)
    elsif type == '3' then
      @nameCategoriesOutlet = Category.select('name').joins('join config_outlets cf on cf.category_id = categories.id')
      @nameProductTypesOutlet = ProductType.select('name').joins('join config_outlets cf on cf.product_type_id = product_types.id')
      Product.joins('join mark_product_types mpt on mpt.product_type_id = products.product_type_id and mpt.mark_id = products.mark_id and products.category_id = mpt.category_id').joins('join category_product_types cpt on cpt.product_type_id = mpt.product_type_id and cpt.category_id = products.category_id').joins('join product_types pt on pt.id = products.product_type_id').joins('join categories cat on cat.id = cpt.category_id').joins('join marks m on m.id = mpt.mark_id').where('products.outlet=1  and pt.name not in (?) and cat.name not in (?)', @nameProductTypesOutlet, @nameCategoriesOutlet).order('m.name, products.name').in_groups_of(3)
    else
      Product.joins(:mark).where('outlet=1 and marks.hidden = 0').order('marks.name, products.name').in_groups_of(3)
    end 
  end
  
   def self.get_all_products_outlet_cambiadoBack(type)
    if type == 'V' then
      Product.joins('join mark_product_types mpt on mpt.product_type_id = products.product_type_id and mpt.mark_id = products.mark_id and products.category_id = mpt.category_id').joins('join category_product_types cpt on cpt.product_type_id = mpt.product_type_id and cpt.category_id = products.category_id').joins('join categories cat on cat.id = cpt.category_id').joins('join marks m on m.id = mpt.mark_id').where('products.outlet=1 and m.hidden = 0 and cat.name like ?', 'Viaje').order('m.name, products.name').in_groups_of(3)
    elsif type == 'B' then
      Product.joins('join mark_product_types mpt on mpt.product_type_id = products.product_type_id and mpt.mark_id = products.mark_id and products.category_id = mpt.category_id').joins('join category_product_types cpt on cpt.product_type_id = mpt.product_type_id and cpt.category_id = products.category_id').joins('join product_types pt on pt.id = products.product_type_id').joins('join marks m on m.id = mpt.mark_id').where('products.outlet=1 and m.hidden = 0 and pt.name like ?', 'Bolso%').order('m.name, products.name').in_groups_of(3)
    elsif type == 'O' then
    Product.joins('join mark_product_types mpt on mpt.product_type_id = products.product_type_id and mpt.mark_id = products.mark_id and products.category_id = mpt.category_id').joins('join category_product_types cpt on cpt.product_type_id = mpt.product_type_id and cpt.category_id = products.category_id').joins('join product_types pt on pt.id = products.product_type_id').joins('join categories cat on cat.id = cpt.category_id').joins('join marks m on m.id = mpt.mark_id').where('products.outlet=1 and m.hidden = 0 and pt.name not like ? and cat.name not like ?', 'Bolso%', 'Viaje').order('m.name, products.name').in_groups_of(3)
    else
      Product.joins(:mark).where('outlet=1 and marks.hidden = 0').order('marks.name, products.name').in_groups_of(3)
    end 
  end

  def check_is_for_sale
    if !product_type_id.nil?
      @category_product_type = CategoryProductType.where('product_type_id = ? and category_id = ?', product_type_id, category_id )
      @category_product_type.each do |cpt|
        @product_type = ProductType.find(cpt.product_type_id)
        if !cpt.nil? and cpt.sale == 1 and self.new_collection != 1
          self.sale = 1
          return
        end
      end
      self.sale = nil
    end
  end
end
