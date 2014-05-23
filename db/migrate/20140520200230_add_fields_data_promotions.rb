class AddFieldsDataPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :date_start, :date
    add_column :promotions, :date_end, :date
  end
end
