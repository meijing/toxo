class AddPriceOutlet < ActiveRecord::Migration
  def change
        add_column :products, :old_price, :float
        add_column :products, :outlet_price, :float
  end
end
