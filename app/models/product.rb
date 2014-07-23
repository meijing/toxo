class Product < ActiveRecord::Base
  has_attached_file :image, styles: {original: '700x525', medium: '200x200>', thumb: '48x48>' }, :default_url => "/images/thumb/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  belongs_to :mark

  scope :is_promotion, lambda {|id|
    @promo = Promotion.find(id)
    if !@promo.nil? and @promo.catalog != ''
      where('upper(name) like ?', '%'.concat(@promo.catalog.upcase).concat('%'))
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

  def check_is_for_sale
    if !product_type_id.nil?
      @category_product_type = CategoryProductType.where('product_type_id = ? and category_id = ?', product_type_id, category_id )
      @category_product_type.each do |cpt|
        @product_type = ProductType.find(cpt.product_type_id)
        if !@product_type.nil? and @product_type.sale = 1 and self.new_collection != 1
          self.sale = 1
        end
      end
    end
  end
end
