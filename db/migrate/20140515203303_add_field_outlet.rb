class AddFieldOutlet < ActiveRecord::Migration
  def change
    add_column :products, :outlet, :integer
  end
end
