class CategoryProductType < ActiveRecord::Base
  belongs_to :category
  belongs_to :product_type

  def self.get_relations product_type_id
    CategoryProductType.where('product_type_id = ? and sale = ?', product_type_id, 1)
  end

  def self.exists_sales
    !CategoryProductType.where('sale=?', 1).empty?
  end
end
