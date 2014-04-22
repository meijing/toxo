class CreateMarkProductTypes < ActiveRecord::Migration
  def change
    create_table :mark_product_types do |t|
      t.references :mark
      t.references :product_type
      t.timestamps
    end
  end
end
