class ProductType < ActiveRecord::Base
  validates :name, :presence => true
  has_many :category_product_types
  has_many :category, :through=> :category_product_types
  has_many :mark_product_types
  has_many :mark, :through=> :mark_product_types

end
