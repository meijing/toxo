class AddFieldTextCatalogToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :text, :string
    add_column :promotions, :catalog, :string
  end
end
