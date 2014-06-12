class AddTypesPromotions < ActiveRecord::Migration
  def change
     add_column :promotions, :end_stocks, :integer
     add_column :promotions, :mark_id, :integer
     add_column :promotions, :product_type_id, :integer
     add_column :promotions, :category_type_id, :integer
  end
end
