class CreateConfigOutlet < ActiveRecord::Migration
  def change
    create_table :config_outlets do |t|
      t.integer :category_id
      t.integer :product_type_id
    end
  end
end
