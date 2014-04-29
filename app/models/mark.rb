class Mark < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '200x200>', thumb: '48x48>' }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :name, :presence => true
  has_many :mark_product_types
  has_many :product_type, :through=> :mark_product_types
  has_many :products
end
