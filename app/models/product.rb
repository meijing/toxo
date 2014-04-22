class Product < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '200x200>', thumb: '48x48>' }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  has_many :mark_products
  has_many :mark, :through=> :mark_products
end
