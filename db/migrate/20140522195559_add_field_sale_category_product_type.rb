class AddFieldSaleCategoryProductType < ActiveRecord::Migration
  def change
    add_column :category_product_types, :sale, :integer
  end
end
