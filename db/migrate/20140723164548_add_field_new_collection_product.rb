class AddFieldNewCollectionProduct < ActiveRecord::Migration
  def change
    add_column :products, :new_collection, :integer
  end
end
