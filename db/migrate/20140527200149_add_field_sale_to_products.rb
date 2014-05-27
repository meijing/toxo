class AddFieldSaleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sale, :integer
  end
end
