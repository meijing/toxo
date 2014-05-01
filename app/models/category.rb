class Category < ActiveRecord::Base
  validates :name, :presence => true
  has_many :category_product_types
  has_many :product_type, :through=> :category_product_types

  def self.find_categories(mark_id, category_id, product_type_id)
    Category.joins('join mark_product_types mpt on mpt.category_id = categories.id').
      where('(mpt.mark_id = ? or ? is null) and (mpt.category_id = ? or ? is null) and (mpt.product_type_id = ? or ? is null)', mark_id, mark_id, category_id, category_id, product_type_id, product_type_id).uniq.order(:name)
  end
end
