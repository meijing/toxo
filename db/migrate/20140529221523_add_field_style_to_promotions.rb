class AddFieldStyleToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :style, :integer
  end
end
