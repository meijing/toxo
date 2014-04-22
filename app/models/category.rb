class Category < ActiveRecord::Base
  validates :name, :presence => true
  has_many :category_product_types
  has_many :product_type, :through=> :category_product_types
end
