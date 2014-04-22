class CreateMarkProducts < ActiveRecord::Migration
  def change
    create_table :mark_products do |t|
      t.references :mark
      t.references :product
      t.timestamps
    end
  end
end
