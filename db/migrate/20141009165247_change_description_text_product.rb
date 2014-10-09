class ChangeDescriptionTextProduct < ActiveRecord::Migration
  def change
    add_column :products, :copy_desc, :string
    execute 'update products set copy_desc = description'
    change_column :products, :description, :text
  end
end
