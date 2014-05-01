class ProductType < ActiveRecord::Base
  validates :name, :presence => true
  has_many :category_product_types
  has_many :category, :through=> :category_product_types
  has_many :mark_product_types
  has_many :mark, :through=> :mark_product_types

  def self.find_product_types(mark_id, category_id)
    ProductType.joins('join mark_product_types mpt on mpt.product_type_id = product_types.id').
      where('(mpt.mark_id = ? or ? is null) and (mpt.category_id = ? or ? is null)', mark_id, mark_id, category_id, category_id).uniq.order(:name)
  end
end
