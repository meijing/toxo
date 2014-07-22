class CategoryProductType < ActiveRecord::Base
  belongs_to :category
  belongs_to :product_type

  def self.get_relations product_type_id
    CategoryProductType.where('product_type_id = ? and sale = 1', product_type_id)
  end
end
