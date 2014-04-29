class AddColumnsToRelations < ActiveRecord::Migration
  def change
    add_column :mark_product_types, :category_id, :integer, :references =>"Mark"
    add_column :mark_products, :product_type_id, :integer, :references =>"ProductType"
    add_column :mark_products, :category_id, :integer, :references =>"Mark"
  end
end
