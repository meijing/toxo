class CreateCategoryProductTypes < ActiveRecord::Migration
  def change
    create_table :category_product_types do |t|
      t.references :category
      t.references :product_type
      t.timestamps
    end
  end
end
