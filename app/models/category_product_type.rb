class CategoryProductType < ActiveRecord::Base
  belongs_to :category
  belongs_to :product_type
end
