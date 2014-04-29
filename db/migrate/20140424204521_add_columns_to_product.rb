class AddColumnsToProduct < ActiveRecord::Migration
  def change
    drop_table :mark_products
    add_column :products, :mark_id, :integer, :references => "Mark"
    add_column :products, :product_type_id, :integer, :references => "ProductType"
    add_column :products, :category_id, :integer, :references => "Category"
  end
end
