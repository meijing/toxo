class AddProductTypeSale < ActiveRecord::Migration
  def change
    add_column :product_types, :sale, :integer
  end
end
