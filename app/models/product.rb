class Product < ActiveRecord::Base
  has_attached_file :image, styles: {original: '200x200', medium: '200x200>', thumb: '48x48>' }, :default_url => "/images/thumb/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  belongs_to :mark

  scope :is_promotion, lambda {|promo_catalog|
    promo_catalog = '%'+promo_catalog+'%'
    where('name like ?', promo_catalog)
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
        if !@product_type.nil? and @product_type.sale = 1
          self.sale = 1
        end
      end
    end
  end
end
