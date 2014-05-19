class Product < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '200x200>', thumb: '48x48>' }, :default_url => "/images/thumb/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  belongs_to :mark

  def self.exists_products_outlet
    if Product.where('outlet =1').length > 0
      return true
    end
    return false
  end

  def self.get_all_products_outlet
    Product.where('outlet=1')
  end
end
